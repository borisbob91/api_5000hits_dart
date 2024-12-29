import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'dart:convert';

class FileService {
  static String decryptUrl(Encrypted encrypted) {
    final key = Key.fromUtf8('_spIXzvzfuJz8Vdqg0Aml-piBoWrVvLhi99KtUp1g2Q='); // Même clé que Django
    final fernet = Fernet(key);
    return fernet.decrypt(encrypted).toString();
  }
}

// extion file decrypt sur string
void main2(){
  print('hi');
  final encrypt = Encrypted(Uint8List.fromList('gAAAAABnbsZtpUx2FYoo6Ker9IsC2Pg_QyhplA5T6Hn2Zpvrm4Je7zrpMiMyklUcjG_iNYyk4fvVTAp-sPdaVI42fofRGfPoqwELFIt2v5mG1qpWoM3rkzApptfXW50wOqXRE7wfhexNBgoBZYlo8zQIi5wYE00NlDdN-9QhRiq1iA70bDw-O4zRwHGoA6p0mu0jnvBCHAQSTRKEbBhqkzSGE0R0mGVTqQ=='.codeUnits));
  print(encrypt.toString());
  FileService.decryptUrl(encrypt);
}


void main() {
  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final key = Key.fromUtf8('_spIXzvzfuJz8Vdqg0Aml-piBoWrVvLhi99KtUp1g2Q=');

  final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0,32));
  // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
  final fernet = Fernet(b64key);
  final encrypter = Encrypter(fernet);



  const hash = "gAAAAABnbsvU6BKEBgZHQCZXq-VmyeXDWUyOtu78niat0odni-EFZyZuaFpN4pPQQcF4FgchIuFwpi-7HpN5ZijemvzurDfnz4PBrOuHU_2RcIjcqoqU8Q1asTQsMxX00MQ9cce6dGBqBp0zDjwF6KAD-wQk6jfIJ9DHDMRFkYcoJMSf2IsedbLfHhc8V3tLocL8jxcFj5SehyhWl_f7DmUdLEPZJJOTNw==";

  final encrypted = encrypter.encrypt(plainText);
  final toDecryp = Encrypted(Uint8List.fromList(hash.codeUnits));

  final decrypted = encrypter.decrypt(encrypted);
  final mydecrypted = encrypter.decrypt(toDecryp);
   print(mydecrypted);
  print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  print(encrypted.base64); // random cipher text
  print(fernet.extractTimestamp(encrypted.bytes)); // unix timestamp
}