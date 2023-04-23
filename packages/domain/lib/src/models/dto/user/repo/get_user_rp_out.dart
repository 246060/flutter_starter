import 'package:app_domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_rp_out.freezed.dart';
part 'get_user_rp_out.g.dart';

@freezed
class GetUserRpOut with _$GetUserRpOut {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory GetUserRpOut({
    User? user,
    Map<String, dynamic>? support,
  }) = _GetUserRpOut;

  GetUserRpOut._();

  factory GetUserRpOut.fromJson(Map<String, dynamic> json) =>
      _$GetUserRpOutFromJson(json);
}
