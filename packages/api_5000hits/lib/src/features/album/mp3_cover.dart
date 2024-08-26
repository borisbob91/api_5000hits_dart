//part of 'mp3_album.dart';


import 'dart:convert';

import 'package:isar/isar.dart';
part 'mp3_cover.g.dart';
@Collection()
class Mp3Cover {
  Id? id;
  String? max;
  String? min;

  Mp3Cover({
    this.id,
    this.max,
    this.min,
  });

  Mp3Cover copyWith({
    String? max,
    String? min,
  }) =>
      Mp3Cover(
        max: max ?? this.max,
        min: min ?? this.min,
      );

  factory Mp3Cover.fromRawJson(String str) => Mp3Cover.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3Cover.fromJson(Map<String, dynamic> json) => Mp3Cover(
    max: json["max"],
    min: json["min"],
  );

  Map<String, dynamic> toJson() => {
    "max": max,
    "min": min,
  };
}
