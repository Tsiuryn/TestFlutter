import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

const String text = 'Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world';
const plainText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, '
    'consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit';

void main() {
  var bytes = utf8.encode(text);

  Digest hash = md5.convert(bytes);
  print(hash);

  var psw1 = '1234';
  var psw2 = '1234';

  /// Криптография текста с помощью библиотек crypto and encrypt
  var encryptedText = _encryptText(plainText: plainText, psw: psw1);
  print(encryptedText);

  print('\n\n');

  var decryptText = _decryptText(encryptedText: encryptedText, psw: psw2);
  print(decryptText);
  print(decryptText.length);
}

String _encryptText({
  required String psw,
  required String plainText,
}) {
  List<int> bytes = utf8.encode(psw);
  Digest hash = md5.convert(bytes);
  final key = Key.fromUtf8(hash.toString());
  final iv = IV.fromLength(16); // max: 16

  return Encrypter(AES(key)).encrypt(plainText, iv: iv).base64;
}

String _decryptText({
  required String psw,
  required String encryptedText,
}) {
  List<int> bytes = utf8.encode(psw);
  Digest hash = md5.convert(bytes);
  final key = Key.fromUtf8(hash.toString());
  final iv = IV.fromLength(16); // max: 16

  return Encrypter(AES(key)).decrypt(Encrypted.fromBase64(encryptedText), iv: iv);
}
