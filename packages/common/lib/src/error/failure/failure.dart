import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

abstract class UseCaseError implements Exception {}

@freezed
class Failure extends UseCaseError with _$Failure {
  factory Failure.networkError() = _NetworkError;
  factory Failure.tokenExpired() = _TokenExpired;
  factory Failure.serverError() = _ServerError;
}
