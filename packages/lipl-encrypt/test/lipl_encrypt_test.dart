import 'package:lipl_encrypt/lipl_encrypt.dart';
import 'package:test/test.dart';

void main() {
  group('Encrypt', () {
    late EncrypterBase encrypter;

    setUp(() {
      encrypter = FernetEncrypter();
    });

    test('First Test', () {
      final String test = 'Paul Min';
      final String encrypted = encrypter.encrypt(test);
      final String decrypted = encrypter.decrypt(encrypted);
      expect(test, decrypted);
    });
  });
}
