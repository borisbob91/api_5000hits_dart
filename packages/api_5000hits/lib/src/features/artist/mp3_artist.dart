// To parse this JSON data, do
//
//     final Mp3Artist = Mp3ArtistFromJson(jsonString);
import 'dart:convert';

class Mp3Artist {
  final int? id;
  final String? slug;
  final String? name;
  final String? photo;
  final String? biography;
  final int? country;
  final int? songs;
  final int? albums;

  Mp3Artist({
    this.id,
    this.slug,
    this.name,
    this.photo,
    this.biography,
    this.country,
    this.songs,
    this.albums,
  });

  Mp3Artist copyWith({
    int? id,
    String? slug,
    String? name,
    String? photo,
    String? biography,
    int? country,
    int? songs,
    int? albums,
  }) =>
      Mp3Artist(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        name: name ?? this.name,
        photo: photo ?? this.photo,
        biography: biography ?? this.biography,
        country: country ?? this.country,
        songs: songs ?? this.songs,
        albums: albums ?? this.albums,
      );

  factory Mp3Artist.fromRawJson(String str) =>
      Mp3Artist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3Artist.fromJson(Map<String, dynamic> json) => Mp3Artist(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    photo: json["photo"],
    biography: json["biography"],
    country: json["country"],
    songs: json["songs"],
    albums: json["albums"],
  );

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
