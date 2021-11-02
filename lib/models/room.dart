part of models;

enum RoomType { chat, group }

@freezed
class Room with _$Room {
  factory Room({
    required int id,
    required List<Message> messages,
    required int unreadMessages,
    required RoomType roomType,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
