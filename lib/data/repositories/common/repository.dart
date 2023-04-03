
import 'package:flutter_starter/core/models/query/filter.dart';
import 'package:flutter_starter/core/models/query/pagination.dart';
import 'package:flutter_starter/core/models/query/projection.dart';
import 'package:flutter_starter/core/models/query/sort.dart';

abstract class LocalRepository<T> {
  Future<void> init();
  Future<int> create({required T t});
  Future<int> update({required T t, Filter? filter});
  Future<int> delete({Filter? filter});
  Future<int> count({Filter? filter});

  Future<T> findById({
    required int id,
    List<Projection> projections = const [],
  });

  Future<List<T>> findAll({
    Filter? filter,
    List<Projection> projections = const [],
    List<Sort> sorts = const [],
    Pagination? pagination,
  });

  Future<void> close();
}

class HttpResponse<T> {
  HttpResponse({
    required this.headers,
    this.statusCode,
    this.data,
    this.isRedirect,
  });

  final T? data;
  final int? statusCode;
  final bool? isRedirect;
  final Map<String, dynamic> headers;

  @override
  String toString() => 'HttpResponse{'
      'data: $data, '
      'statusCode: $statusCode, '
      'isRedirect: $isRedirect, '
      'headers: $headers'
      '}';
}

typedef OnProgress = void Function(int count, int total);
typedef QueryParameters = Map<String, dynamic>;
typedef HttpHeaders = Map<String, dynamic>;

class HttpRequestOptions {
  HttpRequestOptions({
    this.sendTimeout,
    this.receiveTimeout,
    this.followRedirects,
    this.maxRedirects,
    this.onInboundProgress,
    this.onOutboundProgress,
    this.extra,
  });

  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final bool? followRedirects;
  final int? maxRedirects;
  final OnProgress? onInboundProgress;
  final OnProgress? onOutboundProgress;
  final Map<String, dynamic>? extra;
}

abstract class RemoteRepository {

  Future<HttpResponse<T>> get<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  });

  Future<HttpResponse<T>> post<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  });

  Future<HttpResponse<T>> put<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  });

  Future<HttpResponse<T>> patch<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  });

  Future<HttpResponse<T>> delete<T>({
    required String path,
    Object? data,
    QueryParameters? queryParameters,
    HttpHeaders? headers,
    HttpRequestOptions? options,
  });
}
