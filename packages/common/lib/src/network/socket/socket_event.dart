import 'package:freezed_annotation/freezed_annotation.dart';

part 'socket_event.g.dart';
part 'socket_event.freezed.dart';

@freezed
class SocketEvent with _$SocketEvent {

  @JsonSerializable(fieldRename: FieldRename.snake)
  factory SocketEvent({
    required String from,
    required String to,
    required String title,
    required int timestamp,
    dynamic payload,
  }) = _SocketEvent;

  factory SocketEvent.fromJson(Map<String, dynamic> json) =>
      _$SocketEventFromJson(json);
}
