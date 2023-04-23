import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_rp_out.freezed.dart';
part 'delete_user_rp_out.g.dart';


@freezed
class DeleteUserRpOut with _$DeleteUserRpOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory DeleteUserRpOut({
    required int userId
  }) = _DeleteUserRpOut;

  DeleteUserRpOut._();

  factory DeleteUserRpOut.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRpOutFromJson(json);
}
