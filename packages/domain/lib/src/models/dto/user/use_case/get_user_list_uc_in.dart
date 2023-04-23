import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_list_uc_in.freezed.dart';
part 'get_user_list_uc_in.g.dart';

@freezed
class GetUserListUcIn with _$GetUserListUcIn {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory GetUserListUcIn({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _GetUserListUcIn;

  GetUserListUcIn._();

  factory GetUserListUcIn.fromJson(Map<String, dynamic> json) =>
      _$GetUserListUcInFromJson(json);
}
