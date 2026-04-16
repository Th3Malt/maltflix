import 'package:flutter/foundation.dart';
import 'package:maltflix/app_imports.dart';

class DataSourceUnknownError implements IDefaultException {
  @override
  final String message = 'An unknown error occurred. Please try again later.';
  @override
  final StackTrace? stackTrace;
  @override
  final Object exception;
  final int? errorCode;

  DataSourceUnknownError(this.exception, this.errorCode, [this.stackTrace]);

  @override
  String toString() {
    if (kDebugMode) {
      return exception.toString();
    } else {
      return message;
    }
  }
}

class DataSourceConnectionError implements IDefaultException {
  @override
  final String message =
      'Connection error. Please check your internet connection and try again.';
  @override
  final StackTrace? stackTrace;
  @override
  final Object exception;

  DataSourceConnectionError(this.exception, [this.stackTrace]);

  @override
  String toString() {
    if (kDebugMode) {
      return exception.toString();
    } else {
      return message;
    }
  }
}

class DataSourceUnauthorizedError implements IDefaultException {
  @override
  final String message = 'Unauthorized. Please login again.';
  @override
  final StackTrace? stackTrace;
  @override
  final Object exception;

  DataSourceUnauthorizedError(this.exception, [this.stackTrace]);
  @override
  String toString() {
    if (kDebugMode) {
      return exception.toString();
    } else {
      return message;
    }
  }
}
