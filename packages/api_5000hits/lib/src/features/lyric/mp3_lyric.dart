import 'dart:convert';

import 'package:isar/isar.dart';

import 'format_lyric_text.dart';

part 'mp3_lyric.g.dart';

@collection
class Mp3Lyric {
  Id? id = Isar.autoIncrement;
  final String? title;
  final String? cover;
  final int? views;

  @Index(type: IndexType.value)
  final String? genre;

  @Index(type: IndexType.value)
  final String? artist;

  final String? text;
  final DateTime? added;
  final String? addedBy;

  @Index(unique: true, replace: true, type: IndexType.value)
  final String? songSlug;

  Mp3Lyric({
    this.id,
    this.title,
    this.cover,
    this.views,
    this.genre,
    this.artist,
    this.text,
    this.added,
    this.addedBy,
    this.songSlug
  });

  Mp3Lyric copyWith({
    int? id,
    String? title,
    String? cover,
    int? views,
    String? genre,
    String? artist,
    String? text,
    DateTime? added,
    String? addedBy,
    String? songSlug,
  }) =>
      Mp3Lyric(
        id: id ?? this.id,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        views: views ?? this.views,
        genre: genre ?? this.genre,
        artist: artist ?? this.artist,
        text: text ?? this.text,
        added: added ?? this.added,
        addedBy: addedBy ?? this.addedBy,
        songSlug: songSlug ?? this.songSlug,
      );

  factory Mp3Lyric.fromRawJson(String str) =>
      Mp3Lyric.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3Lyric.fromJson(Map<String, dynamic> json) => Mp3Lyric(
    id: json["id"],
    title: json["title"]?? 'unknown title',
    cover: json["cover"]?? 'unknown cover',
    views: json["views"] ?? 0,
    genre: json["genre"]?? 'unknown genre',
    artist: json["artist"]?? 'unknown artist',
    text: nettoyerTexte(json["text"]),
    added: json["added"] == null ? null : DateTime.parse(json["added"]),
    addedBy: json["added_by"]?? 'unknown added by',
    songSlug: json["song_slug"]?? 'unknown song slug',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "cover": cover,
    "views": views,
    "genre": genre,
    "artist": artist,
    "text": text,
    "added": added?.toIso8601String(),
    "added_by": addedBy,
    'song_slug': songSlug,
  };
}
