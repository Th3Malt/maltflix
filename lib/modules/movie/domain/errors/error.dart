import 'package:maltflix/app_imports.dart';

class MovieInfraException extends IDefaultException {
  MovieInfraException([
    Object? exception,
    String? message,
    StackTrace? stackTrace,
  ]) : super(
         message ??
             'Um erro ocorreu ao buscar os filmes. Tente novamente mais tarde.',
         exception ?? Exception(),
         stackTrace,
       );
}
