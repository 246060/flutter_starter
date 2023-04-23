import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_rp_in.freezed.dart';
part 'get_user_rp_in.g.dart';

@freezed
class GetUserRpIn with _$GetUserRpIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory GetUserRpIn({
    required int id,
  }) = _GetUserRpIn;

  GetUserRpIn._();

  factory GetUserRpIn.fromJson(Map<String, dynamic> json) =>
      _$GetUserRpInFromJson(json);
}
