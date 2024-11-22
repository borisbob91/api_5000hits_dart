import 'package:isar/isar.dart';
import '../album/mp3_cover.dart';
import 'mp3_album_release_track.dart';

part 'mp3_album_release.g.dart';

@Collection()
class Mp3AlbumRelease {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  String? artist;

  @Index(caseSensitive: false)
  String? album;

  @Index(caseSensitive: false)
  String? rdate;

  DateTime? added;
  int? author;
  int? visible;
  int? views;
  String? comment;

  final cover = IsarLink<Mp3Cover>();
  final tracks = IsarLinks<Mp3AlbumReleaseTrack>();

  Mp3AlbumRelease({
    this.artist = '',
    this.album = '',
    this.rdate = '',
    this.added,
    this.author = 0,
    this.visible = 0,
    this.views = 0,
    this.comment = '',
  });

  Mp3AlbumRelease copyWith({
    String? artist,
    String? album,
    String? rdate,
    DateTime? added,
    int? author,
    int? visible,
    int? views,
    String? comment,
    Mp3Cover? cover,
    List<Mp3AlbumReleaseTrack>? tracks,
  }) {
    final copy = Mp3AlbumRelease(
      artist: artist ?? this.artist,
      album: album ?? this.album,
      rdate: rdate ?? this.rdate,
      added: added ?? this.added,
      author: author ?? this.author,
      visible: visible ?? this.visible,
      views: views ?? this.views,
      comment: comment ?? this.comment,
    );

    if (cover != null) {
      copy.cover.value = cover;
    }

    if (tracks != null) {
      copy.tracks.clear();
      copy.tracks.addAll(tracks);
    }

    return copy;
  }

  factory Mp3AlbumRelease.fromJson(Map<String, dynamic> json) {
    final release = Mp3AlbumRelease(
      artist: json["artist"],
      album: json["album"],
      rdate: json["rdate"],
      added: json["added"] == null ? null : DateTime.parse(json["added"]),
      author: json["author"],
      visible: json["visible"],
      views: json["views"],
      comment: json["comment"],
    );

    if (json["cover"] != null) {
      release.cover.value = Mp3Cover.fromJson(json["cover"]);
    }

    if (json["tracklist"] != null) {
      print('tracklist: ${json["tracklist"]}');
      final tracks = (json["tracklist"] as Map<String, dynamic>).entries.map(
              (entry) => Mp3AlbumReleaseTrack.fromJson(entry, albumId: release.id)
      ).toList();
      release.tracks.addAll(tracks);
      print('----------tracklist: ${release.tracks}');
    }

    return release;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "artist": artist,
    "album": album,
    "rdate": rdate,
    "added": added?.toIso8601String(),
    "author": author,
    "visible": visible,
    "views": views,
    "comment": comment,
    "cover": cover.value?.toJson(),
    "tracklist": tracks.fold<Map<String, String>>({},
            (map, track) => map..addAll({track.trackNumber ?? '': track.trackName ?? ''})
    )
  };

  @override
  String toString() => 'AlbumRelease(id: $id, artist: $artist, album: $album)';
}