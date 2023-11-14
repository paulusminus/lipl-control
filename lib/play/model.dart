import 'package:lipl_model/lipl_model.dart';

extension LyricX on Lyric {
  List<LyricPart> toLyricParts() {
    final List<LyricPart> result = <LyricPart>[];
    for (int i = 0; i < parts.length; i++) {
      result.add(LyricPart(
          current: i + 1,
          total: parts.length,
          title: title,
          text: parts[i].join('\n')));
    }
    return result;
  }
}

extension ListLyricX on List<Lyric> {
  List<LyricPart> toLyricParts() {
    final List<LyricPart> result = <LyricPart>[];
    for (final Lyric lyric in this) {
      result.addAll(lyric.toLyricParts());
    }
    return result;
  }
}

class LyricPart {
  const LyricPart({
    required this.title,
    required this.current,
    required this.total,
    required this.text,
  });

  final String title;
  final int current;
  final int total;
  final String text;
}
