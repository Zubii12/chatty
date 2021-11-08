import 'package:graphql/client.dart';

QueryOptions updateUserMutation({
  required String phone,
  required String name,
  required String? photo,
}) {
  return QueryOptions(
    document: gql(r'''
mutation updateUserMutation($phone: String!, $name: String!, $photo: String!) {
  update_users(where: {phone: {_eq: $phone}}, _set: {name: $name, photo: $photo}) {
    affected_rows
  }
}
'''),
    variables: <String, dynamic>{
      'phone': phone,
      'name': name,
      'photo': photo,
    },
  );
}
