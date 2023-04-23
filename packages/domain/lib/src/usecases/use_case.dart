import 'package:app_common/common.dart';
import 'package:multiple_result/multiple_result.dart';

mixin UseCase<I, O> {
  Future<Result<O, Failure>> call(I i);
}
