import 'package:flutter/foundation.dart';

class AppException implements Exception {
  late final String message;
  AppException({required this.message});

  String msgString() {
    if (kDebugMode) {
      print("Error message : $message");
    }

    return "Error message : $message";
  }
}

class InternetException extends AppException {
  InternetException({required String message})
      : super(message: " No internet avalable ");
}

class RequestTimeout extends AppException {
  RequestTimeout({required String message})
      : super(message: " Request timeout ");
}

class ServerException extends AppException {
  ServerException({required String message})
      : super(message: " Internal service error ");
}

class InvalidUrlException extends AppException {
  InvalidUrlException({required String message})
      : super(message: " Invalid url ");
}

class FetchDataException extends AppException {
  FetchDataException({required String message})
      : super(message: "Unable to fetch data");
}

class UnhandledException extends AppException {
  UnhandledException({required String message})
      : super(message: "System error");
}

class HttpErrorException extends AppException {
  HttpErrorException({required String message})
      : super(message: "Http exception");
}
// HttpException