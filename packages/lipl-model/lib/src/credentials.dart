import 'package:equatable/equatable.dart';

class Credentials extends Equatable {
  static const String usernameKey = 'username';
  static const String passwordKey = 'password';

  const Credentials({required this.username, required this.password});
  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];

  @override
  String toString() => '$username:$password';
}
