import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_rp_out.freezed.dart';
part 'update_user_rp_out.g.dart';


@freezed
class UpdateUserRpOut with _$UpdateUserRpOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory UpdateUserRpOut({
    required int userId
  }) = _UpdateUserRpOut;

  UpdateUserRpOut._();

  factory UpdateUserRpOut.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRpOutFromJson(json);
}
