import 'package:graphql/client.dart';

QueryOptions insertContactMutation({required int contactId, required int userId}) {
  return QueryOptions(
    document: gql(r'''
mutation insertContactMutation($user_id: Int!, $contact_id: Int!) {
  insert_contacts_one(object: {user_id: $user_id, contact_id: $contact_id}) {
    id
  }
}
'''),
    variables: <String, dynamic>{'contact_id': contactId, 'user_id': userId},
  );
}
