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

  @Index(unique: true, replace: true, type: IndexType.value)
  final String? songSlug;

  @Index(type: IndexType.value)
  final String? genre;

  @Index(type: IndexType.value)
  final String? artist;
  final String? cover;

  Mp3Video({
    this.id,
    this.added,
    this.title,
    this.addedBy,
    this.ytId,
    this.views,
    this.songSlug,
    this.genre,
    this.artist,
    this.cover,
  });

  Mp3Video copyWith({
    int? id,
    DateTime? added,
    String? title,
    String? addedBy,
    String? ytId,
    int? views,
    String? songSlug,
    String? genre,
    String? artist,
    String? cover,
  }) =>
      Mp3Video(
        id: id ?? this.id,
        added: added ?? this.added,
        title: title ?? this.title,
        addedBy: addedBy ?? this.addedBy,
        ytId: ytId ?? this.ytId,
        views: views ?? this.views,
        songSlug: songSlug ?? this.songSlug,
        genre: genre ?? this.genre,
        artist: artist ?? this.artist,
        cover: cover ?? this.cover,
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
    songSlug: json["song_slug"],
    genre: json["genre"],
    artist: json["artist"],
    cover: json["cover"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added": added?.toIso8601String(),
    "title": title,
    "added_by": addedBy,
    "yt_id": ytId,
    "views": views,
    "song_slug": songSlug,
    "genre": genre,
    "artist": artist,
    "cover": cover,
  };
}

