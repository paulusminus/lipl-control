import 'package:bs58/bs58.dart';
import 'package:uuid/parsing.dart';
import 'package:uuid/v4.dart';

String newId() {
  final uuid = UuidV4().generate();
  final bytes = UuidParsing.parseAsByteList(uuid);
  final s = base58.encode(bytes);
  return s;
}
