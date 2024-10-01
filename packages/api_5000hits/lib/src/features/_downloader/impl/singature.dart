import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../interfaces.dart';

class SignatureGenerator implements SignatureGeneratorInterface {
  final String _apiKey;

  SignatureGenerator(this._apiKey);

  @override
  String generateSignature(String slug, int timestamp) {
    final data = '$slug$timestamp$_apiKey';
    return md5.convert(utf8.encode(data)).toString();
  }
}