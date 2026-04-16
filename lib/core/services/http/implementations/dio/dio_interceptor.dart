import 'package:dio/dio.dart';

class CustomDioInterceptors extends Interceptor {
  CustomDioInterceptors();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final headers = <String, dynamic>{};

    final updatedOptions = options.copyWith(
      headers: headers,
      baseUrl: options.baseUrl,
      connectTimeout: const Duration(minutes: 5),
    );

    return super.onRequest(updatedOptions, handler);
  }
}
