import 'package:dio/dio.dart';

import '../../../extra/configs/logger_config.dart';
import 'repository.dart';

class DioRepository extends RemoteRepository {
  DioRepository({required Dio client}) : _client = client;

  final Dio _client;
  final _DioHelper _helper = _DioHelper();
  final _DioMapper _mapper = _DioMapper();

  @override
  Future<HttpResponse<T>> get<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  }) async {
    assert(
      options?.onInboundProgress == null,
      'DioRepository get: no need requestOptions.onInboundProgress param',
    );

    try {
      final response = await _client.get<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mapper.toDioOptions(headers: headers, options: options),
        onReceiveProgress: options?.onInboundProgress,
      );

      _helper.debugPrint<T>(response);

      return _mapper.toHttpResponse(response);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse<T>> post<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  }) async {
    try {
      final response = await _client.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mapper.toDioOptions(headers: headers, options: options),
        onSendProgress: options?.onOutboundProgress,
        onReceiveProgress: options?.onInboundProgress,
      );

      _helper.debugPrint<T>(response);

      return _mapper.toHttpResponse(response);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse<T>> put<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  }) async {
    try {
      final response = await _client.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mapper.toDioOptions(headers: headers, options: options),
        onReceiveProgress: options?.onInboundProgress,
        onSendProgress: options?.onOutboundProgress,
      );

      _helper.debugPrint<T>(response);

      return _mapper.toHttpResponse(response);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse<T>> patch<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  }) async {
    try {
      final response = await _client.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mapper.toDioOptions(headers: headers, options: options),
        onReceiveProgress: options?.onInboundProgress,
        onSendProgress: options?.onOutboundProgress,
      );

      _helper.debugPrint<T>(response);

      return _mapper.toHttpResponse(response);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse<T>> delete<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  }) async {
    assert(
      options?.onInboundProgress == null,
      'DioRepository delete: no need requestOptions.onInboundProgress param',
    );
    assert(
      options?.onOutboundProgress == null,
      'DioRepository delete: no need requestOptions.onOutboundProgress param',
    );

    try {
      final response = await _client.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _mapper.toDioOptions(headers: headers, options: options),
      );

      _helper.debugPrint<T>(response);

      return _mapper.toHttpResponse(response);
    } on Exception catch (_) {
      rethrow;
    }
  }
}

class _DioMapper {
  HttpResponse<T> toHttpResponse<T>(Response<T> dioResponse) => HttpResponse<T>(
        data: dioResponse.data,
        headers: dioResponse.headers.map,
        isRedirect: dioResponse.isRedirect,
        statusCode: dioResponse.statusCode,
      );

  Options toDioOptions({
    HttpHeaders? headers,
    HttpRequestOptions? options,
  }) =>
      Options(
        headers: headers ?? <String, dynamic>{},
        receiveTimeout: options?.receiveTimeout,
        followRedirects: options?.followRedirects,
        sendTimeout: options?.sendTimeout,
      );
}

class _DioHelper {
  String stripMargin(String s) => s.splitMapJoin(
        RegExp('^', multiLine: true),
        onMatch: (_) => '\n',
        onNonMatch: (n) => n.trim(),
      );

  void debugPrint<T>(Response<T> response) => log.d(
        stripMargin('''
      request-options-headers: ${response.requestOptions.headers}
      request-options-baseUrl: ${response.requestOptions.baseUrl}
      request-options-followRedirects: ${response.requestOptions.followRedirects}
      request-options-connectTimeout: ${response.requestOptions.connectTimeout}
      request-options-sendTimeout: ${response.requestOptions.sendTimeout}
      request-options-receiveTimeout: ${response.requestOptions.receiveTimeout}
      
      response-statusCode: ${response.statusCode}
      response-data: ${response.data}
      '''),
      );
}
