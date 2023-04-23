import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_rp_in.freezed.dart';
part 'update_user_rp_in.g.dart';

@freezed
class UpdateUserRpIn with _$UpdateUserRpIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory UpdateUserRpIn({
    required int id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UpdateUserRpIn;

  UpdateUserRpIn._();

  factory UpdateUserRpIn.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRpInFromJson(json);
}
