
import 'package:isar/isar.dart';
part 'auth_model.g.dart';

@collection
class Token {
  Id? id = Isar.autoIncrement;
  final String? access;
  final String? refresh;
  final String? expire;

  Token({this.access, this.refresh, this.expire});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      access: json['access'],
      refresh: json['refresh'],
      expire: json['expire'],
    );
  }

  Map<String, dynamic> toJson() => {
    if (access != null) 'access': access,
    if (refresh != null) 'refresh': refresh,
    if (expire != null) 'expire': expire,
  };

  Token copyWith({
    String? access,
    String? refresh,
    String? expire,
  }) {
    return Token(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
      expire: expire ?? this.expire,
    );
  }
}