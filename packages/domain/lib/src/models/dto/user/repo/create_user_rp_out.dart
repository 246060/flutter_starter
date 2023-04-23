import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_rp_out.freezed.dart';
part 'create_user_rp_out.g.dart';

@freezed
class CreateUserRpOut with _$CreateUserRpOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory CreateUserRpOut({
    int? userId,
  }) = _CreateUserRpOut;

  CreateUserRpOut._();

  factory CreateUserRpOut.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRpOutFromJson(json);
}
