import 'package:multiple_result/multiple_result.dart';

mixin UseCase<T> {
  Result<dynamic, dynamic> call(T t);
}
