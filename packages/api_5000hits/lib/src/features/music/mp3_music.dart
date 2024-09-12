// To parse this JSON data, do
//
//     final Mp3Music = Mp3MusicFromJson(jsonString);

import 'dart:convert';

import 'package:api_5000hits/src/features/album/mp3_album.dart';
import 'package:api_5000hits/src/features/album/mp3_cover.dart';
import 'package:api_5000hits/src/features/lyric/mp3_lyric.dart';
import 'package:api_5000hits/src/features/video/mp3_video.dart';


// class Mp3Music {
//   int? id;
//   String? slug;
//   String? artist;
//   String? title;
//   String? album;
//   String? genre;
//   String? track;
//   String? year;
//   String? duration;
//   String? bitrate;
//   dynamic label;
//   Mp3Cover? cover;
//   String? filesize;
//   int? hits;
//   int? country;
//   DateTime? uploaded;
//   String? uploader;
//   Mp3Lyric? lyrics;
//   Mp3Video? video;

//   Mp3Music({
//     this.id,
//     this.slug,
//     this.artist,
//     this.title,
//     this.album,
//     this.genre,
//     this.track,
//     this.year,
//     this.duration,
//     this.bitrate,
//     this.label,
//     this.cover,
//     this.filesize,
//     this.hits,
//     this.country,
//     this.uploaded,
//     this.uploader,
//     this.lyrics,
//     this.video,
//   });

//   Mp3Music copyWith({
//     int? id,
//     String? slug,
//     String? artist,
//     String? title,
//     String? album,
//     String? genre,
//     String? track,
//     String? year,
//     String? duration,
//     String? bitrate,
//     dynamic label,
//     Mp3Cover? cover,
//     String? filesize,
//     int? hits,
//     int? country,
//     DateTime? uploaded,
//     String? uploader,
//     Mp3Lyric? lyrics,
//     Mp3Video? video,
//   }) =>
//       Mp3Music(
//         id: id ?? this.id,
//         slug: slug ?? this.slug,
//         artist: artist ?? this.artist,
//         title: title ?? this.title,
//         album: album ?? this.album,
//         genre: genre ?? this.genre,
//         track: track ?? this.track,
//         year: year ?? this.year,
//         duration: duration ?? this.duration,
//         bitrate: bitrate ?? this.bitrate,
//         label: label ?? this.label,
//         cover: cover ?? this.cover,
//         filesize: filesize ?? this.filesize,
//         hits: hits ?? this.hits,
//         country: country ?? this.country,
//         uploaded: uploaded ?? this.uploaded,
//         uploader: uploader ?? this.uploader,
//         lyrics: lyrics ?? this.lyrics,
//         video: video ?? this.video,
//       );

//   factory Mp3Music.fromRawJson(String str) =>
//       Mp3Music.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Mp3Music.fromJson(Map<String, dynamic> json) => Mp3Music(
//     id: json["id"],
//     slug: json["slug"],
//     artist: json["artist"],
//     title: json["title"],
//     album: json["album"],
//     genre: json["genre"],
//     track: json["track"],
//     year: json["year"],
//     duration: json["duration"],
//     bitrate: json["bitrate"],
//     label: json["label"],
//     cover: json["cover"] == null ? null : Mp3Cover.fromJson(json["cover"]),
//     filesize: json["filesize"],
//     hits: json["hits"],
//     country: json["country"],
//     uploaded:
//     json["uploaded"] == null ? null : DateTime.parse(json["uploaded"]),
//     uploader: json["uploader"],
//     lyrics: json["lyrics"] == null
//         ? null
//         : Mp3Lyric.fromJson(json["lyrics"]),
//     video:
//     json["video"] == null ? null : Mp3Video.fromJson(json["video"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "slug": slug,
//     "artist": artist,
//     "title": title,
//     "album": album,
//     "genre": genre,
//     "track": track,
//     "year": year,
//     "duration": duration,
//     "bitrate": bitrate,
//     "label": label,
//     "cover": cover?.toJson(),
//     "filesize": filesize,
//     "hits": hits,
//     "country": country,
//     "uploaded": uploaded?.toIso8601String(),
//     "uploader": uploader,
//     "lyrics": lyrics?.toJson(),
//     "video": video?.toJson(),
//   };
// }


import 'package:isar/isar.dart';

part 'mp3_music.g.dart';

@collection
class Mp3Music {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true, type: IndexType.value)
  late String slug;

  @Index(type: IndexType.value)
  late String artist;

  @Index(type: IndexType.value)
  late String title;

  late String? album;

  @Index(type: IndexType.value)
  late String? genre;
  
  late String? track;
  late String? year;
  late String? duration;
  late String? bitrate;
  late String? label;
  late String? filesize;
  late int? hits;
  late int? country;
  late DateTime? uploaded;
  late String? uploader;

  final cover = IsarLink<Mp3Cover>();
  
  // Note: For lyrics and video, you might want to create separate Isar collections
  // and use IsarLinks if you need to query or index these fields
  @Ignore()
  Mp3Lyric? lyrics;
  
  @Ignore()
  Mp3Video? video;

  Mp3Music({
    this.slug = '',
    this.artist = '',
    this.title = '',
    this.album = '',
    this.genre = '',
    this.track = '',
    this.year = '',
    this.duration = '',
    this.bitrate = '',
    this.label = '',
    this.filesize = '',
    this.hits = 0,
    this.country = 0,
    this.uploaded,
    this.uploader = '',
    this.lyrics,
    this.video,
  });

  factory Mp3Music.fromJson(Map<String, dynamic> json) {
    final music = Mp3Music(
      slug: json['slug'] ?? '',
      artist: json['artist'] ?? '',
      title: json['title'] ?? '',
      album: json['album'] ?? '',
      genre: json['genre'] ?? '',
      track: json['track'] ?? '',
      year: json['year'] ?? '',
      duration: json['duration'] ?? '',
      bitrate: json['bitrate'] ?? '',
      label: json['label'] ?? '',
      filesize: json['filesize'] ?? '',
      hits: json['hits'] ?? 0,
      country: json['country'] ?? 0,
      uploaded: json['uploaded'] != null ? DateTime.parse(json['uploaded']) : null,
      uploader: json['uploader'] ?? '',
      lyrics: json['lyrics'] != null ? Mp3Lyric.fromJson(json['lyrics']) : null,
      video: json['video'] != null ? Mp3Video.fromJson(json['video']) : null,
    );

    if (json['cover'] != null) {
      music.cover.value = Mp3Cover.fromJson(json['cover']);
    }

    return music;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'slug': slug,
      'artist': artist,
      'title': title,
      'album': album,
      'genre': genre,
      'track': track,
      'year': year,
      'duration': duration,
      'bitrate': bitrate,
      'label': label,
      'filesize': filesize,
      'hits': hits,
      'country': country,
      'uploaded': uploaded?.toIso8601String(),
      'uploader': uploader,
      'lyrics': lyrics?.toJson(),
      'video': video?.toJson(),
    };

    if (cover.value != null) {
      data['cover'] = cover.value!.toJson();
    }

    return data;
  }
}