import 'dart:convert';
import 'dart:developer';

import 'package:maltflix/app_imports.dart';

class HttpDioService implements IHttpService {
  final Dio _dio;

  const HttpDioService(this._dio);

  @override
  Future<String?> restRequest({
    required String url,
    required HttpMethodsEnum method,
    Map<String, dynamic>? headers,
    dynamic body,
    bool ignoreRefreshToken = false,
    bool printResultOnSuccess = false,
    bool ignoreBaseUrl = false,
    Map<String, dynamic>? query,
  }) async {
    try {
      headers ??= {};
      if (ignoreRefreshToken) {
        headers.addAll({'ignoreRefreshToken': true});
      }
      if (ignoreBaseUrl) {
        headers.addAll({'ignoreBaseUrl': true});
      }
      if (!ignoreBaseUrl && _dio.options.headers.containsKey('ignoreBaseUrl')) {
        _dio.options.headers.remove('ignoreBaseUrl');
      }
      _dio.options.headers.addAll(headers);
      final Response result = await _dio.request(
        url,
        options: Options(method: method.str),
        data: body,
        queryParameters: query,
      );
      if (result.data != null) {
        final encodedResult = jsonEncode(result.data);
        if (printResultOnSuccess) {
          log('$HttpDioService result: $encodedResult');
        }
        return encodedResult;
      } else {
        return null;
      }
    } on DioException catch (e, s) {
      if (e.error is SocketException) {
        throw DataSourceConnectionError(e, s);
      }
      if (e.response?.statusCode == 401) {
        throw DataSourceUnauthorizedError(e, s);
      }
      throw DataSourceUnknownError(e, e.response?.statusCode, s);
    } catch (e, s) {
      throw DataSourceUnknownError(e, null, s);
    }
  }
}

class DioFactory {
  static Dio create() {
    return Dio()
      ..interceptors.addAll([
        CurlLoggerDioInterceptor(printOnSuccess: kDebugMode),
      ]);
  }
}
