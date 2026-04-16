abstract class HttptMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

enum HttpMethodsEnum {
  post('POST'),
  get('GET'),
  put('PUT'),
  delete('DELETE'),
  patch('PATCH');

  final String str;
  const HttpMethodsEnum(this.str);
}
