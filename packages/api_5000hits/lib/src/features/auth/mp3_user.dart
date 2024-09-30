import 'dart:convert';

import 'package:isar/isar.dart';
part 'mp3_user.g.dart';

@collection
class Mp3User {
  Id? id = Isar.autoIncrement;
  final String? username;
  final String? password;
  final String? email;
  final String? fullName;
  final DateTime? registered;
  final int? country;
  final String? language;

  Mp3User({
    this.id,
    this.username,
    this.password,
    this.email,
    this.fullName,
    this.registered,
    this.country,
    this.language,
  });

  Mp3User copyWith({
    Id? id,
    String? username,
    String? password,
    String? email,
    String? fullName,
    DateTime? registered,
    int? country,
    String? language,
  }) =>
      Mp3User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        registered: registered ?? this.registered,
        country: country ?? this.country,
        language: language ?? this.language,
      );

  factory Mp3User.fromRawJson(String str) =>
      Mp3User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3User.fromJson(Map<String, dynamic> json) => Mp3User(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        fullName: json["full_name"],
        registered: json["registered"] == null
            ? null
            : DateTime.parse(json["registered"]),
        country: json["country"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "full_name": fullName,
        "registered": registered?.toIso8601String(),
        "country": country,
        "language": language,
      };
}