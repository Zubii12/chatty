import 'package:chatty/models/index.dart';

abstract class ContentService {
  const ContentService();

  Future<User> getUserData({required String phone});

  Future<void> updateUserData({
    required String phone,
    required String name,
    required String? photo,
  });
}
