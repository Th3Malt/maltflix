abstract class IDefaultException implements Exception {
  final String? message;
  final StackTrace? stackTrace;
  final Object exception;

  const IDefaultException(this.message, this.exception, [this.stackTrace]);

  @override
  String toString() {
    return message ?? 'An unknown error occurred, please try again later!';
  }
}
