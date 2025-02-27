import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials.freezed.dart';
part 'credentials.g.dart';

@freezed
abstract class Credentials with _$Credentials {
  const Credentials._();
  const factory Credentials({
    @Default(null) String? username,
    @Default(null) String? password,
  }) = _Credentials;

  factory Credentials.fromJson(Map<String, Object?> json) =>
      _$CredentialsFromJson(json);
}
