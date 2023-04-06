import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/index.dart';

class SampleRepositoryImpl implements SampleRepository {
  SampleRepositoryImpl({
    required Box<Map<String, dynamic>> localDataSource,
    required Dio remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final Box<Map<String, dynamic>> _localDataSource;
  final Dio _remoteDataSource;
}
