import 'dart:io' show Platform;

String username() => Platform.environment['LIPL_USERNAME']!;
String password() => Platform.environment['LIPL_PASSWORD']!;
