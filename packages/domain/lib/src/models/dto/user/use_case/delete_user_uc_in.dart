import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_uc_in.freezed.dart';
part 'delete_user_uc_in.g.dart';

@freezed
class DeleteUserUcIn with _$DeleteUserUcIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory DeleteUserUcIn({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _DeleteUserUcIn;

  DeleteUserUcIn._();

  factory DeleteUserUcIn.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserUcInFromJson(json);
}
