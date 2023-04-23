import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_uc_out.freezed.dart';
part 'delete_user_uc_out.g.dart';

@freezed
class DeleteUserUcOut with _$DeleteUserUcOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory DeleteUserUcOut({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _DeleteUserUcOut;

  DeleteUserUcOut._();

  factory DeleteUserUcOut.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserUcOutFromJson(json);
}
