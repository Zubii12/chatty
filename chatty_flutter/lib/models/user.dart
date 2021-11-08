part of models;

@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    required String phone,
    String? photo,
    required bool phoneVerified,
    required DateTime lastSeen,
    required DateTime lastTyped,
    required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
