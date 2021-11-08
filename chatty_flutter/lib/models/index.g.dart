// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String?,
      phoneVerified: json['phoneVerified'] as bool,
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      lastTyped: DateTime.parse(json['lastTyped'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'photo': instance.photo,
      'phoneVerified': instance.phoneVerified,
      'lastSeen': instance.lastSeen.toIso8601String(),
      'lastTyped': instance.lastTyped.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$_Room _$$_RoomFromJson(Map<String, dynamic> json) => _$_Room(
      id: json['id'] as int,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadMessages: json['unreadMessages'] as int,
      roomType: _$enumDecode(_$RoomTypeEnumMap, json['roomType']),
    );

Map<String, dynamic> _$$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'id': instance.id,
      'messages': instance.messages,
      'unreadMessages': instance.unreadMessages,
      'roomType': _$RoomTypeEnumMap[instance.roomType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$RoomTypeEnumMap = {
  RoomType.chat: 'chat',
  RoomType.group: 'group',
};

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as int,
      senderId: json['senderId'] as int,
      message: json['message'] as String?,
      media: json['media'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'message': instance.message,
      'media': instance.media,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$_Story _$$_StoryFromJson(Map<String, dynamic> json) => _$_Story(
      id: json['id'] as int,
      media: json['media'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
      'id': instance.id,
      'media': instance.media,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$_AuthData _$$_AuthDataFromJson(Map<String, dynamic> json) => _$_AuthData(
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$_AuthDataToJson(_$_AuthData instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };
