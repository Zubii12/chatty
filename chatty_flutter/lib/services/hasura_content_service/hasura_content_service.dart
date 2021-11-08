import 'package:chatty/models/index.dart';
import 'package:chatty/services/content_service.dart';
import 'package:chatty/shared/exceptions/incomplete_profile.dart';
import 'package:chatty/shared/graphql/client.dart';
import 'package:chatty/shared/graphql/mutations/update_user.dart';
import 'package:chatty/shared/graphql/queries/user.dart';
import 'package:graphql/src/core/query_result.dart';

class HasuraContentService extends ContentService {
  HasuraContentService({required GQClient client}) : _client = client;

  final GQClient _client;

  @override
  Future<User> getUserData({required String phone}) async {
    final QueryResult result = await _client.runOperation(options: userQuery(phone: phone));
    final User user = User.fromJson(result.data!['users'].first);

    if (user.name == 'null') {
      throw IncompleteProfileException();
    }

    return user;
  }

  @override
  Future<void> updateUserData({
    required String phone,
    required String name,
    required String? photo,
  }) async {
    await _client.runOperation(
      options: updateUserMutation(phone: phone, name: name, photo: photo),
    );
  }
}
