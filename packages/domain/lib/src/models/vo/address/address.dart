import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
class Address with _$Address {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Address({
    required String country,
    required String city,
    required String street,
    required String detail,
    required int zipcode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
