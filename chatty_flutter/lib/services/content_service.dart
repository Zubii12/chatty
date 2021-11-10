import 'package:chatty/models/index.dart';

abstract class ContentService {
  const ContentService();

  Future<User> getUserData({required String phone});

  Future<void> updateUserData({
    required String phone,
    required String name,
    required String? photo,
  });

  Future<List<User>> getContactsData({required int id, required String keyword});

  Future<List<User>> searchUsers({required String keyword, required String phone, required List<int> contactsId});

  Future<void> addNewContact({required int contactId, required int userId});
}
