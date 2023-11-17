import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

mixin class HasSummary {
  late String id;
  late String title;
}

@freezed
class Summary with _$Summary {
  const Summary._();
  const factory Summary({
    required String id,
    required String title,
  }) = _Summary;

  factory Summary.fromJson(Map<String, Object?> json) =>
      _$SummaryFromJson(json);

  @override
  String toString() => 'Summary: $title';
}
