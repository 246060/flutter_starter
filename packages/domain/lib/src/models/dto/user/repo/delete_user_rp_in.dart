import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_rp_in.freezed.dart';
part 'delete_user_rp_in.g.dart';

@freezed
class DeleteUserRpIn with _$DeleteUserRpIn {

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory DeleteUserRpIn({
    required int userId,
  }) = _DeleteUserRpIn;

  DeleteUserRpIn._();

  factory DeleteUserRpIn.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRpInFromJson(json);
}
