part of models;

@freezed
class Message with _$Message {
  factory Message({
    required int id,
    required int senderId,
    String? message,
    String? media,
    required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
