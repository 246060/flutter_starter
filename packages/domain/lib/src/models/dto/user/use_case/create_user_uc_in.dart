import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_uc_in.freezed.dart';
part 'create_user_uc_in.g.dart';

@freezed
class CreateUserUcIn with _$CreateUserUcIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory CreateUserUcIn({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _CreateUserUcIn;

  CreateUserUcIn._();

  factory CreateUserUcIn.fromJson(Map<String, dynamic> json) =>
      _$CreateUserUcInFromJson(json);
}
