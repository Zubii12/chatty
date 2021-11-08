import 'package:graphql/client.dart';

QueryOptions userQuery({required String phone}) {
  return QueryOptions(
    document: gql(r'''
query userQuery($phone: String!) {
  users(where: {phone: {_eq: $phone}}) {
    id
    name
    phone
    photo
    phoneVerified
    lastSeen
    lastTyped
    createdAt
  }
}
'''),
    variables: <String, dynamic>{'phone': phone},
  );
}
