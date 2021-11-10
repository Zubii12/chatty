import 'package:graphql/client.dart';

QueryOptions searchUsersQuery({required String keyword, required String phone, required List<int> contactsId}) {
  return QueryOptions(
    document: gql(r'''
query searchUsersQuery($keyword: String!, $phone: String!, $contacts_id: [Int!]!) {
  users(where: {name: {_ilike: $keyword}, _and: {phone: {_neq: $phone}, _and: {id: {_nin: $contacts_id}}}}) {
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
    variables: <String, dynamic>{
      'keyword': '%$keyword%',
      'phone': phone,
      'contacts_id': contactsId,
    },
  );
}
