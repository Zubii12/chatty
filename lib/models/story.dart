part of models;

@freezed
class Story with _$Story {
  factory Story({
    required int id,
    required String media,
    required DateTime createdAt,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
