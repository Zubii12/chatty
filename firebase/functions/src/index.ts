import Vonage from '@vonage/server-sdk';
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import * as firebase from 'firebase/app';
import { config, hasuraConfig, serviceAccount, vonageSettings } from './config';
import { GraphQLClient, gql } from 'graphql-request';

admin.initializeApp({
  credential: admin.credential.cert({
    projectId: config.projectId,
    privateKey: serviceAccount.privateKey,
    clientEmail: serviceAccount.clientEmail,
  }),
});

firebase.initializeApp({
  apiKey: config.serverApiKey,
  projectId: config.projectId,
});

const vonage = new Vonage(
  {
    apiKey: vonageSettings.apiKey,
    apiSecret: vonageSettings.apiSecret,
  },
  {
    debug: vonageSettings.debug,
  },
);

const graphQLClient = new GraphQLClient(hasuraConfig.graphqlHttpsEndpoint, {
  headers: {
    ['x-hasura-admin-secret']: hasuraConfig.xHasuraAdminSecret,
  },
});

const setPhoneVerifiedMutation = gql`
  mutation setPhoneVerifiedMutation($phone: String!) {
    update_users(where: { phone: { _eq: $phone } }, _set: { phone_verified: true }) {
      affected_rows
    }
  }
`;

export const sendOTP = functions.https.onRequest((req, res) => {
  const jsonString = JSON.stringify(req.body);

  const {
    event: { op, data },
    table,
  } = req.body;

  console.log(`baaa ${op}`);
  console.log(`baaa ${data}`);
  console.log(`baaa ${data.new.phone}`);
  console.log(`baaa ${table}`);

  let phone = '';
  JSON.parse(jsonString, (key, value) => {
    if (key === 'phone') {
      phone = value;
    }
  });

  console.log(phone);

  const vonage = new Vonage(
    {
      apiKey: vonageSettings.apiKey,
      apiSecret: vonageSettings.apiSecret,
    },
    {
      debug: vonageSettings.debug,
    },
  );

  if (phone.length !== 0) {
    vonage.verify.request(
      {
        number: phone,
        brand: config.projectName,
        pin_expiry: vonageSettings.pinExpiry,
        workflow_id: vonageSettings.workflowId,
        code_length: vonageSettings.codeLength,
      },
      (error, result) => {
        if (error) {
          console.error(error);
          res.status(500).send(`Send OTP - error - ${error}`);
        } else {
          res.status(200).send(`Sent OTP - successful - ${result}`);
        }
      },
    );
  } else {
    console.error('Send OTP - error - Phone missing');
    res.status(500).send('Send OTP - error - Phone missing');
  }
});

export const verifyOTP = functions.https.onCall((data) => {
  const code = data.code;
  const requestId = data.requestId;
  const phone = data.phone;

  console.log(code);
  console.log(requestId);
  console.log(phone);

  if (code.length !== 0 || requestId.length !== 0) {
    vonage.verify.check({ code: code, request_id: requestId }, async (error, result) => {
      if (error) {
        console.error(error);
        throw new functions.https.HttpsError('unknown', 'Verify OTP - error', error);
      } else {
        await graphQLClient.request(setPhoneVerifiedMutation, {
          phone: phone,
        });
        console.log(`Verify OTP - successful - ${result}`);
        vonage.verify.control({ cmd: 'cancel', request_id: requestId }, (error, result) => {
          if (error) {
            console.error(error);
            throw new functions.https.HttpsError('unknown', 'Cancel OTP - error', error);
          } else {
            console.log(`Verify OTP - successful - ${result}`);
          }
        });
      }
    });
  } else {
    console.error('Verify OTP - error - Phone or requestId missing');
    throw new functions.https.HttpsError('internal', 'Verify OTP - error - Phone or requestId missing');
  }
});
