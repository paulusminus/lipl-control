import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lipl_model/lipl_model.dart';

extension CredentialsExtension on Credentials {
  String get basicAuthenticationHeaderValue {
    List<int> bytes = utf8.encode(toString());
    final encoded = base64Encode(bytes);
    return 'Basic $encoded';
  }
}

Dio basicAuthenticationDio({required Credentials credentials}) {
  return Dio()
    ..interceptors.add(
      basicAuthentication(
        credentials: credentials,
      ),
    );
}

InterceptorsWrapper basicAuthentication({required Credentials credentials}) {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers.addAll(
        {
          HttpHeaders.authorizationHeader:
              credentials.basicAuthenticationHeaderValue,
        },
      );
      return handler.next(options);
    },
  );
}
