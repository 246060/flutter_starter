import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_uc_out.freezed.dart';
part 'create_user_uc_out.g.dart';

@freezed
class CreateUserUcOut with _$CreateUserUcOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory CreateUserUcOut({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _CreateUserUcOut;

  CreateUserUcOut._();

  factory CreateUserUcOut.fromJson(Map<String, dynamic> json) =>
      _$CreateUserUcOutFromJson(json);
}
