part of models;

@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    String? photo,
    required String phone,
    required List<Room> rooms,
    required List<Story> stories,
    required DateTime lastSeen,
    required DateTime lastTyped,
  }) = _User;

  factory User.fromJson(dynamic json) => _$UserFromJson(json);
}
