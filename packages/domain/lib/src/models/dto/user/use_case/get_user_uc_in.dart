import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_uc_in.freezed.dart';
part 'get_user_uc_in.g.dart';

@freezed
class GetUserUcIn with _$GetUserUcIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory GetUserUcIn({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _GetUserUcIn;

  GetUserUcIn._();

  factory GetUserUcIn.fromJson(Map<String, dynamic> json) =>
      _$GetUserUcInFromJson(json);
}
