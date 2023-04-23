import 'dart:async';

import './socket_event.dart';

class SocketStream {
  final _streamController = StreamController<SocketEvent>();

  void Function(SocketEvent) get addResponse => _streamController.sink.add;

  Stream<SocketEvent> get getResponse => _streamController.stream;

  Future<void> dispose() async {
    await _streamController.close();
  }
}
