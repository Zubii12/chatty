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

const createUserMutation = gql`
  mutation createUserMutation($user: users_insert_input!) {
    insert_users_one(object: $user, on_conflict: { constraint: users_phone_key, update_columns: [phone_verified] }) {
      id
    }
  }
`;
export const sendOTP = functions.https.onCall((data) => {
  const phone = data.phone;

  console.log(phone);

  if (phone.length !== 0) {
    return new Promise((resolve) => {
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
            throw new functions.https.HttpsError('unknown', 'Sent OTP - error', error);
          } else {
            const { request_id } = result;

            console.log(`Sent OTP - successful - ${request_id}`);
            resolve(request_id);
          }
        },
      );
    });
  } else {
    console.error('Send OTP - error - Phone missing');
    throw new functions.https.HttpsError('internal', 'Sent OTP - error - Phone missing');
  }
});

export const verifyOTP = functions.https.onCall(async (data) => {
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
        await graphQLClient.request(createUserMutation, {
          user: {
            phone: phone,
            name: 'null',
            phone_verified: true,
          },
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
