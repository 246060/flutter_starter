import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure({required Exception ex}) = _Failure;

  factory Failure.networkError() = _NetworkError;

  factory Failure.tokenExpired() = _TokenExpired;
}
