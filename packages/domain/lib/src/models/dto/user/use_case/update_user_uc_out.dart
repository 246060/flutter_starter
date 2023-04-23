import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_uc_out.freezed.dart';
part 'update_user_uc_out.g.dart';

@freezed
class UpdateUserUcOut with _$UpdateUserUcOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory UpdateUserUcOut({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UpdateUserUcOut;

  UpdateUserUcOut._();

  factory UpdateUserUcOut.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserUcOutFromJson(json);
}
