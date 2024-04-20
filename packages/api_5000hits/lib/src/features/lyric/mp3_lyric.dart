// To parse this JSON data, do
//
//     final Mp3Lyric = Mp3LyricFromJson(jsonString);
import 'dart:convert';

class Mp3Lyric {
  final int? id;
  final DateTime? added;
  final String? title;
  final String? addedBy;
  final String? ytId;
  final int? views;

  Mp3Lyric({
    this.id,
    this.added,
    this.title,
    this.addedBy,
    this.ytId,
    this.views,
  });

  Mp3Lyric copyWith({
    int? id,
    DateTime? added,
    String? title,
    String? addedBy,
    String? ytId,
    int? views,
  }) =>
      Mp3Lyric(
        id: id ?? this.id,
        added: added ?? this.added,
        title: title ?? this.title,
        addedBy: addedBy ?? this.addedBy,
        ytId: ytId ?? this.ytId,
        views: views ?? this.views,
      );

  factory Mp3Lyric.fromRawJson(String str) =>
      Mp3Lyric.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3Lyric.fromJson(Map<String, dynamic> json) => Mp3Lyric(
    id: json["id"],
    added: json["added"] == null ? null : DateTime.parse(json["added"]),
    title: json["title"],
    addedBy: json["added_by"],
    ytId: json["yt_id"],
    views: json["views"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added": added?.toIso8601String(),
    "title": title,
    "added_by": addedBy,
    "yt_id": ytId,
    "views": views,
  };
}
