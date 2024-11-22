// mp3_report.dart
import 'dart:convert';

class Mp3Report {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? type;
  String? pages;
  String? content;
  DateTime? added;

  Mp3Report({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.type,
    this.pages,
    this.content,
    this.added,
  });

  Mp3Report copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    String? type,
    String? pages,
    String? content,
    DateTime? added,
  }) =>
      Mp3Report(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        type: type ?? this.type,
        pages: pages ?? this.pages,
        content: content ?? this.content,
        added: added ?? this.added,
      );

  factory Mp3Report.fromRawJson(String str) =>
      Mp3Report.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mp3Report.fromJson(Map<String, dynamic> json) => Mp3Report(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    type: json["type"],
    pages: json["pages"],
    content: json["content"],
    added: json["added"] == null ? null : DateTime.parse(json["added"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "phone": phone,
    "type": type,
    "pages": pages,
    "content": content,
    "added": added?.toIso8601String(),
  };
}