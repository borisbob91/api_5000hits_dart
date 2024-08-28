// // To parse this JSON data, do
// //
// //     final albumEntity = albumEntityFromJson(jsonString);

// import 'dart:convert';

// import 'package:isar/isar.dart';

// part 'mp3_cover.dart';

// part 'mp3_album.g.dart';

// @Collection()
// class Mp3Album {
//   Id id = Isar.autoIncrement;
  
//   @Index(type: IndexType.value)
//   late String? slug;
  
//   @Index(type: IndexType.value)
//   late String? artist;
  
//   @Index(type: IndexType.value)
//   late String name;

//   String? genre;
//   String? year;
//   String? duration;
//   int? tracksNb;
//   String? label;
//   //Mp3Cover? cover;
//   String? filesize;
//   int? hits;
//   int? country;
//   DateTime? uploaded;
//   int? uploader;
//   int? visible;
//   String? otherInfos;
//   int? likes;
//   int? dislikes;
//   String? trackList;
//   final cover = IsarLink<Mp3Cover>();
//   Mp3Album({
//     this.id= Isar.autoIncrement,
//     this.slug,
//     this.artist,
//     this.name='',
//     this.genre,
//     this.year,
//     this.duration,
//     this.tracksNb,
//     this.label,
//     this.cover,
//     this.filesize,
//     this.hits,
//     this.country,
//     this.uploaded,
//     this.uploader,
//     this.visible,
//     this.otherInfos,
//     this.likes,
//     this.dislikes,
//     this.trackList,
//   });

//   Mp3Album copyWith({
//     int? id,
//     String? slug,
//     String? artist,
//     String? name,
//     String? genre,
//     String? year,
//     String? duration,
//     int? tracksNb,
//     String? label,
//     Mp3Cover? cover,
//     String? filesize,
//     int? hits,
//     int? country,
//     DateTime? uploaded,
//     int? uploader,
//     int? visible,
//     String? otherInfos,
//     int? likes,
//     int? dislikes,
//     String? trackList,
//   }) =>
//       Mp3Album(
//         id: id ?? this.id,
//         slug: slug ?? this.slug,
//         artist: artist ?? this.artist,
//         name: name ?? this.name,
//         genre: genre ?? this.genre,
//         year: year ?? this.year,
//         duration: duration ?? this.duration,
//         tracksNb: tracksNb ?? this.tracksNb,
//         label: label ?? this.label,
//         cover: cover ?? this.cover,
//         filesize: filesize ?? this.filesize,
//         hits: hits ?? this.hits,
//         country: country ?? this.country,
//         uploaded: uploaded ?? this.uploaded,
//         uploader: uploader ?? this.uploader,
//         visible: visible ?? this.visible,
//         otherInfos: otherInfos ?? this.otherInfos,
//         likes: likes ?? this.likes,
//         dislikes: dislikes ?? this.dislikes,
//         trackList: trackList ?? this.trackList,
//       );

//   factory Mp3Album.fromRawJson(String str) =>
//       Mp3Album.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Mp3Album.fromJson(Map<String, dynamic> json) => Mp3Album(
//     id: json["id"],
//     slug: json["slug"],
//     artist: json["artist"],
//     name: json["name"],
//     genre: json["genre"],
//     year: json["year"],
//     duration: json["duration"],
//     tracksNb: json["tracks_nb"],
//     label: json["label"],
//     cover: json["cover"] == null ? null : Mp3Cover.fromJson(json["cover"]),
//     filesize: json["filesize"],
//     hits: json["hits"],
//     country: json["country"],
//     uploaded:
//     json["uploaded"] == null ? null : DateTime.parse(json["uploaded"]),
//     uploader: json["uploader"],
//     visible: json["visible"],
//     otherInfos: json["other_infos"],
//     likes: json["likes"],
//     dislikes: json["dislikes"],
//     trackList: json["track_list"],
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "slug": slug,
//     "artist": artist,
//     "name": name,
//     "genre": genre,
//     "year": year,
//     "duration": duration,
//     "tracks_nb": tracksNb,
//     "label": label,
//     "cover": cover?.toJson(),
//     "filesize": filesize,
//     "hits": hits,
//     "country": country,
//     "uploaded": uploaded?.toIso8601String(),
//     "uploader": uploader,
//     "visible": visible,
//     "other_infos": otherInfos,
//     "likes": likes,
//     "dislikes": dislikes,
//     "track_list": trackList,
//   };

//   @override
//   String toString(){
//     return "Album(slug: $slug, name:$name)\n";
//   }

// }


// Fichier: mp3_album.dart
import 'package:isar/isar.dart';

import 'mp3_cover.dart';

part 'mp3_album.g.dart';

@collection
class Mp3Album {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true ,type: IndexType.value)
  late String slug;

  @Index(type: IndexType.value)
  late String artist;

  @Index(type: IndexType.value)
  late String name;

  late String? genre;
  late String? year;
  late String? duration;
  late int? tracksNb;
  late String? label;
  late String? filesize;
  late int? hits;
  late int? country;
  late DateTime? uploaded;
  late int? uploader;
  late int visible;
  late String otherInfos;
  late int likes;
  late int dislikes;
  late String trackList;

  final cover = IsarLink<Mp3Cover>();

  Mp3Album({
    this.slug = '',
    this.artist = '',
    this.name = '',
    this.genre = '',
    this.year = '',
    this.duration = '',
    this.tracksNb = 0,
    this.label = '',
    this.filesize = '',
    this.hits = 0,
    this.country = 0,
    this.uploaded,
    this.uploader = 0,
    this.visible = 0,
    this.otherInfos = '',
    this.likes = 0,
    this.dislikes = 0,
    this.trackList = '',
  });

  factory Mp3Album.fromJson(Map<String, dynamic> json) {
    final album = Mp3Album(
      slug: json['slug'] ?? '',
      artist: json['artist'] ?? '',
      name: json['name'] ?? '',
      genre: json['genre'] ?? '',
      year: json['year'] ?? '',
      duration: json['duration'] ?? '',
      tracksNb: json['tracks_nb'] ?? 0,
      label: json['label'] ?? '',
      filesize: json['filesize'] ?? '',
      hits: json['hits'] ?? 0,
      country: json['country'] ?? 0,
      uploaded: json['uploaded'] != null ? DateTime.parse(json['uploaded']) : null,
      uploader: json['uploader'] ?? 0,
      visible: json['visible'] ?? 0,
      otherInfos: json['other_infos'] ?? '',
      likes: json['likes'] ?? 0,
      dislikes: json['dislikes'] ?? 0,
      trackList: json['track_list'] ?? '',
    );

    if (json['cover'] != null) {
      album.cover.value = Mp3Cover.fromJson(json['cover']);
    }

    return album;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'slug': slug,
      'artist': artist,
      'name': name,
      'genre': genre,
      'year': year,
      'duration': duration,
      'tracks_nb': tracksNb,
      'label': label,
      'filesize': filesize,
      'hits': hits,
      'country': country,
      'uploaded': uploaded?.toIso8601String(),
      'uploader': uploader,
      'visible': visible,
      'other_infos': otherInfos,
      'likes': likes,
      'dislikes': dislikes,
      'track_list': trackList,
    };

    if (cover.value != null) {
      data['cover'] = cover.value!.toJson();
    }

    return data;
  }
}
