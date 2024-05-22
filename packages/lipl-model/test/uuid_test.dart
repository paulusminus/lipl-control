import 'package:lipl_model/src/model/uuid.dart';
import 'package:test/test.dart';

void main() {
  group("Uuid", () {
    test("new", () {
      final uuid = newId();
      print(uuid);
      expect(uuid.length, 22);
    });
  });
}
