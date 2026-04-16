import 'http_methods.dart';

abstract class IHttpService {
  Future<String?> restRequest({
    required String url,
    required HttpMethodsEnum method,
    Map<String, dynamic>? headers,
    dynamic body,
    bool ignoreRefreshToken = false,
    bool printResultOnSuccess = false,
    bool ignoreBaseUrl = false,
    Map<String, dynamic>? query,
  });
}
