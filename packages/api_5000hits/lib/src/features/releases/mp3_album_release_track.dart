import 'package:isar/isar.dart';
import 'dart:convert';

part 'mp3_album_release_track.g.dart';

@Collection()
class Mp3AlbumReleaseTrack {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('trackNumber')])
  int? albumReleaseId;

  String? trackNumber;
  String? trackName;

  Mp3AlbumReleaseTrack({
    this.albumReleaseId,
    this.trackNumber,
    this.trackName,
  });

  factory Mp3AlbumReleaseTrack.fromJson(MapEntry<String, dynamic> json, {int? albumId}) {
    return Mp3AlbumReleaseTrack(
      albumReleaseId: albumId,
      trackNumber: json.key,
      trackName: json.value.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    "albumReleaseId": albumReleaseId,
    "trackNumber": trackNumber,
    "trackName": trackName,
  };

  @override
  String toString() => 'Track(number $trackNumber: $trackName, )';
}