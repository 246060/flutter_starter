import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_uc_in.freezed.dart';
part 'update_user_uc_in.g.dart';

@freezed
class UpdateUserUcIn with _$UpdateUserUcIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory UpdateUserUcIn({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UpdateUserUcIn;

  UpdateUserUcIn._();

  factory UpdateUserUcIn.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserUcInFromJson(json);
}
