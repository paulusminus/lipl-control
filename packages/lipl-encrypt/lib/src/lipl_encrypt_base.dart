import 'package:encrypt/encrypt.dart';

abstract class EncrypterBase {
  String encrypt(String s);
  String decrypt(String s);
}

class FernetEncrypter implements EncrypterBase {
  FernetEncrypter() {
    final Key b64Key =
        Key.fromBase64('qWuvg3Y472gMacojObL8xVKap7iAY/+7+0TS3U1ubn0=');
    final fernet = Fernet(b64Key);
    encrypter = Encrypter(fernet);
  }

  late Encrypter encrypter;

  @override
  String decrypt(String s) => encrypter.decrypt64(s);

  @override
  String encrypt(String s) => encrypter.encrypt(s).base64;
}
