import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_uc_out.freezed.dart';
part 'get_user_uc_out.g.dart';

@freezed
class GetUserUcOut with _$GetUserUcOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory GetUserUcOut({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _GetUserUcOut;

  GetUserUcOut._();

  factory GetUserUcOut.fromJson(Map<String, dynamic> json) =>
      _$GetUserUcOutFromJson(json);
}
