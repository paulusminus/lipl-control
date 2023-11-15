import 'package:test/test.dart';
import 'package:lipl_model/src/parts.dart';

void main() {
  group('Parts', () {
    test('Trim', () {
      const input = ' Yui   \r\t ';
      const output = 'Yui';
      expect(trim(input), equals(output));
    });

    test('Split by newline', () {
      const input = 'Hal\nJui\n\n';
      const output = 'Hal\tJui\t\t';
      expect(split(splitNewLine)(input).join('\t'), equals(output));
    });

    test('Trim lines', () {
      const input = ['\t Dit ', '   \ris ', 'een'];
      const output = [
        'Dit',
        'is',
        'een',
      ];
      expect(trimLines(input), equals(output));
    });

    test('Non empty string', () {
      const input = ['', '\t', ' '];
      const output = [false, true, true];
      expect(input.map(nonEmptyString), equals(output));
    });

    test('Join lines', () {
      const input = ['Dit', 'is', 'een', 'test'];
      const output = 'Dit is een test';
      expect(join(' ')(input), equals(output));
    });

    test('Split by double newline', () {
      const input = 'Er\n\nis\n\neen\n  \nKindeke';
      const output = 'Er\tis\teen\tKindeke';
      expect(split(splitDoubleNewLine)(input).join('\t'), equals(output));
    });

    test('Sanitize', () {
      const input =
          " Er is \neen kindeke\r\ngeboren op d'aard\n\n\n\n\nEr is een kindeke\nGeboren op d' aard\n\n";
      const output =
          "Er is\neen kindeke\ngeboren op d'aard\n\nEr is een kindeke\nGeboren op d' aard";
      expect(sanitize(input), equals(output));
    });
  });
}
