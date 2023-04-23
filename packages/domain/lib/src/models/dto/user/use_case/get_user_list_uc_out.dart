import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_list_uc_out.freezed.dart';
part 'get_user_list_uc_out.g.dart';

@freezed
class GetUserListUcOut with _$GetUserListUcOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory GetUserListUcOut({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _GetUserListUcOut;

  GetUserListUcOut._();

  factory GetUserListUcOut.fromJson(Map<String, dynamic> json) =>
      _$GetUserListUcOutFromJson(json);
}
