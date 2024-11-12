import 'dart:convert';
import 'package:isar/isar.dart';

import '../album/mp3_cover.dart';

part 'mp3_artist.g.dart';

@collection
class Mp3Artist {
  Id? id = Isar.autoIncrement;

  @Index(unique: true, replace: true ,type: IndexType.value)
  final String slug;
  final String name;

  final String biography;
  final int country;
  final int songs;
  final int albums;
  final photo = IsarLink<Mp3Cover>();

  Mp3Artist({
    this.id,
    this.slug = '',
    this.name = '',
    this.biography = '',
    this.country = 0,
    this.songs = 0,
    this.albums = 0,
  });

  Mp3Artist copyWith({
    int? id,
    String? slug,
    String? name,
    //Mp3Cover? photo,
    String? biography,
    int? country,
    int? songs,
    int? albums,
  }) {
   final artist = Mp3Artist(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      biography: biography ?? this.biography,
      country: country ?? this.country,
      //photo: photo != null ? Mp3Cover.fromJson(photo) : null,
      songs: songs ?? this.songs,
      albums: albums ?? this.albums,
    );
    return artist;
  }

  factory Mp3Artist.fromRawJson(String str) =>
      Mp3Artist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3Artist.fromJson(Map<String, dynamic> json) {
    final artist = Mp3Artist(
      id: json['id'],
      slug: json['slug'] ?? '',
      name: json['name'] ?? '',
      biography: json['biography'] ?? '',
      country: json['country'] ?? 0,
      songs: json['songs'] ?? 0,
      albums: json['albums'] ?? 0,
    );

    if (json['photo'] != null) {
      artist.photo.value = Mp3Cover.fromJson(json['photo']);
    }

    return artist;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "photo": photo,
    "biography": biography,
    "country": country,
    "songs": songs,
    "albums": albums,
  };
}