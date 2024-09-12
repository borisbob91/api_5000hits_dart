// To parse this JSON data, do
//
//     final Mp3Video = Mp3VideoFromJson(jsonString);

import 'dart:convert';

import 'package:isar/isar.dart';

part 'mp3_video.g.dart';

@Collection()
class Mp3Video {
   Id? id = Isar.autoIncrement;
  final DateTime? added;
  final String? title;
  final String? addedBy;
  final String? ytId;
  final int? views;

  Mp3Video({
    this.id,
    this.added,
    this.title,
    this.addedBy,
    this.ytId,
    this.views,
  });

  Mp3Video copyWith({
    int? id,
    DateTime? added,
    String? title,
    String? addedBy,
    String? ytId,
    int? views,
  }) =>
      Mp3Video(
        id: id ?? this.id,
        added: added ?? this.added,
        title: title ?? this.title,
        addedBy: addedBy ?? this.addedBy,
        ytId: ytId ?? this.ytId,
        views: views ?? this.views,
      );

  factory Mp3Video.fromRawJson(String str) =>
      Mp3Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3Video.fromJson(Map<String, dynamic> json) => Mp3Video(
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
