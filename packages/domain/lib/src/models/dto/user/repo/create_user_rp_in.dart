import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_rp_in.freezed.dart';
part 'create_user_rp_in.g.dart';


@freezed
class CreateUserRpIn with _$CreateUserRpIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory CreateUserRpIn({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _CreateUserRpIn;

  CreateUserRpIn._();

  factory CreateUserRpIn.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRpInFromJson(json);
}
