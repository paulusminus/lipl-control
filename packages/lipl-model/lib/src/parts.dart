typedef SplitBy = Iterable<String> Function(String);
typedef JoinWith = String Function(Iterable<String>);

const splitNewLine = r'\n';
const splitDoubleNewLine = r'\n\s*\n';
const joinNewLine = '\n';

extension PartsX on Iterable<Iterable<String>> {
  String toText() => map(join(joinNewLine)).join(joinNewLine * 2);
}

extension StringX on String {
  List<List<String>> toParts() =>
      split(splitDoubleNewLine)(this).map(toPart).where(nonEmptyList).toList();
}

String trim(String text) => text.trim();

SplitBy split(String regexp) => (text) => text.split(RegExp(regexp));

Iterable<String> trimLines(Iterable<String> lines) => lines.map(trim);

bool nonEmptyString(String text) => text.isNotEmpty;

bool nonEmptyList(Iterable list) => list.isNotEmpty;

JoinWith join(String separator) => (lines) => lines.join(separator);

List<String> toPart(String text) =>
    split(splitNewLine)(text).map(trim).where(nonEmptyString).toList();

// String toText(Iterable<Iterable<String>> list) =>
//     list.map(join(joinNewLine)).join(joinNewLine * 2);

String sanitize(String text) => text.toParts().toText();
