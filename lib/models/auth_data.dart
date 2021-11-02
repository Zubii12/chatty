part of models;

@freezed
class AuthData with _$AuthData {
  factory AuthData({
    required String accessToken,
    required String refreshToken,
    required int accountId,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);
}
