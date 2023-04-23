import 'package:multiple_result/multiple_result.dart';

import '../exceptions/failure.dart';

mixin UseCase<I, O> {
  Future<Result<O, Failure>> call(I i);
}
