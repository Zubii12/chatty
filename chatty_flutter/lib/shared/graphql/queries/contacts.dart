import 'package:graphql/client.dart';

QueryOptions contactsQuery({required int id, required String keyword}) {
  return QueryOptions(
    document: gql(r'''
query contactsQuery($id: Int!, $boolean_expressions: [contacts_bool_exp!]!) {
  contacts(where: {user_id: {_eq: $id}, _and: $boolean_expressions}) {
    user {
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
}
'''),
    variables: <String, dynamic>{
      'id': id,
      'boolean_expressions': <dynamic>[
        <String, dynamic>{
          'user': <String, dynamic>{
            'name': <String, dynamic>{
              '_ilike': '%$keyword%',
            },
          },
        }
      ],
    },
  );
}
