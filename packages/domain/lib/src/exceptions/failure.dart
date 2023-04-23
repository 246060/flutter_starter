import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';


@freezed
class Failure with _$Failure {
  factory Failure.unknown() = _UnknownError;
  factory Failure.notFound() = _NotFoundError;
  factory Failure.tokenExpired() = _TokenExpiredError;
  factory Failure.serverError() = _ServerError;
}
