import 'package:dio/dio.dart';

class DioLogInterceptor extends LogInterceptor {
  DioLogInterceptor({
    super.request = true,
    super.requestHeader = true,
    super.requestBody = false,
    super.responseHeader = true,
    super.responseBody = false,
    super.error = true,
    super.logPrint = print,
  }) : stringBuffer = StringBuffer();

  final StringBuffer stringBuffer;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    stringBuffer.writeln('*** Request ***');
    _printKV('uri', options.uri);
    //options.headers;

    if (request) {
      _printKV('method', options.method);
      _printKV('responseType', options.responseType.toString());
      _printKV('followRedirects', options.followRedirects);
      _printKV('persistentConnection', options.persistentConnection);
      _printKV('connectTimeout', options.connectTimeout);
      _printKV('sendTimeout', options.sendTimeout);
      _printKV('receiveTimeout', options.receiveTimeout);
      _printKV(
        'receiveDataWhenStatusError',
        options.receiveDataWhenStatusError,
      );
      _printKV('extra', options.extra);
    }
    if (requestHeader) {
      stringBuffer.writeln('headers:');
      options.headers.forEach(_printKV);
    }
    if (requestBody) {
      stringBuffer.writeln('data:');
      _printAll(options.data);
    }

    logPrint(stringBuffer.toString().trimRight());
    stringBuffer.clear();

    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    stringBuffer.writeln('*** Response ***');
    _printResponse(response);

    logPrint(stringBuffer.toString().trimRight());
    stringBuffer.clear();

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (error) {
      stringBuffer
        ..writeln('*** DioError ***:')
        ..writeln('uri: ${err.requestOptions.uri}')
        ..writeln('$err');

      if (err.response != null) {
        _printResponse(err.response!);
      }
    }

    logPrint(stringBuffer.toString().trimRight());
    stringBuffer.clear();

    handler.next(err);
  }

  void _printResponse(Response<dynamic> response) {
    _printKV('uri', response.requestOptions.uri);
    if (responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }

      stringBuffer.writeln('headers:');
      response.headers.forEach(
        (key, v) => _printKV(key, v.join('\r\n\t')),
      );
    }
    if (responseBody) {
      stringBuffer.writeln('Response Text:');
      _printAll(response.toString());
    }
  }

  void _printKV(String key, Object? v) {
    stringBuffer.writeln('   $key: $v');
  }

  void _printAll(dynamic msg) {
    msg?.toString().split('\n').forEach(stringBuffer.writeln);
  }
}
