import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:socket_io_client/socket_io_client.dart';

final socket = io(
  'http://localhost:3000',
  OptionBuilder().setTransports(['websocket']).build(),
);

final asyncSampleProvider = AsyncNotifierProvider<AsyncSampleProvider, int>(
  AsyncSampleProvider.new,
);

class AsyncSampleProvider extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() => 0;

  Future<void> incrementCounter() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      return state.requireValue + 1;
    });
  }
}

class SocketManager {
  SocketManager({
    this.onConnect,
    this.onConnecting,
    this.onConnectTimeout,
    this.onConnectError,
    this.onReconnect,
    this.onReconnecting,
    this.onReconnectAttempt,
    this.onReconnectFailed,
    this.onReconnectError,
    this.onDisconnect,
    this.onError,
  });

  final void Function(dynamic data)? onConnect;
  final void Function(dynamic data)? onConnecting;
  final void Function(dynamic data)? onConnectTimeout;
  final void Function(dynamic data)? onConnectError;
  final void Function(dynamic data)? onReconnect;
  final void Function(dynamic data)? onReconnecting;
  final void Function(dynamic data)? onReconnectAttempt;
  final void Function(dynamic data)? onReconnectFailed;
  final void Function(dynamic data)? onReconnectError;
  final void Function(dynamic data)? onDisconnect;
  final void Function(dynamic data)? onError;

  late Socket _socket;

  void _init() {
    _socket = io(
      'http://localhost:3000',
      OptionBuilder().setTransports(['websocket']).build(),
    );

    _socket
      ..onConnect((data) => onConnect?.call(data))
      ..onConnecting((data) => onConnecting?.call(data))
      ..onConnectTimeout((data) => onConnectTimeout?.call(data))
      ..onConnectError((data) => onConnectError?.call(data))
      ..onReconnect((data) => onReconnect?.call(data))
      ..onReconnecting((data) => onReconnecting?.call(data))
      ..onReconnectAttempt((data) => onReconnectAttempt?.call(data))
      ..onReconnectFailed((data) => onReconnectFailed?.call(data))
      ..onReconnectError((data) => onReconnectError?.call(data))
      ..onDisconnect((data) => onDisconnect?.call(data))
      ..onError((data) => onError?.call(data));
  }

  Socket get socket => _socket;

  void connect() {
    _init();
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }

  void dispose() {
    _socket.dispose();
  }

  void on({
    required EventType eventType,
    required void Function(dynamic event) handler,
  }) {
    _socket.on(eventType.name, handler);
  }

  void emit(EventType eventType, dynamic data) {
    _socket.emit(eventType.name, data);
  }

  void emitWithAck(
    EventType eventType,
    dynamic data,
    void Function(dynamic) ack,
  ) {
    _socket.emitWithAck(eventType.name, data, ack: ack);
  }
}

enum EventType {
  roomMessage(name: 'room_message'),
  roomParticipant(name: 'room_participant'),
  roomTyping(name: 'room_message');

  const EventType({required this.name});

  final String name;
}

final socketStreamProvider =
    StreamProvider.family<List<dynamic>, Socket>((ref, socket) async* {
  //
  final stream = StreamController<dynamic>();
  socket.on('message', stream.add);
  ref.onDispose(stream.close);

  final createMessageUseCase = CreateMessageUseCase(repo: MessageRepository());
  final deleteMessageUseCase = DeleteMessageUseCase(repo: MessageRepository());
  final updateUserUseCase = UpdateUserUseCase(repo: UserRepository());
  final getMessageUseCase = GetMessageUseCase(repo: MessageRepository());

  var allMessages = List<Message>.unmodifiable([]);
  final result0 = await getMessageUseCase();
  result0.whenSuccess((success) {
    allMessages = success;
  });

  await for (final event in stream.stream) {
    event as Map<String, dynamic>;

    if (event['title'] == 'message_delete') {
      final result = await deleteMessageUseCase(event);
      result.whenSuccess((message) {
        allMessages = allMessages
            .map((m) => m.id == message.id ? message : m)
            .toList(growable: false);
      });
    } else if (event['title'] == 'message_create') {
      final result = await createMessageUseCase(event);
      result.whenSuccess((message) {
        allMessages = [...allMessages, message];
      });
    } else if (event['title'] == 'user_update') {
      final result = await updateUserUseCase(event);
      result.whenSuccess((user) {
        allMessages = allMessages.map((m) {
          if (m.user?.id == user.id) {
            m.copyWith(user: user);
          }
          return m;
        }).toList(growable: true);
      });
    }

    yield allMessages;
  }
});

class CreateMessageUseCase {
  CreateMessageUseCase({required this.repo});

  final MessageRepository repo;

  Future<Result<Message, dynamic>> call(Map<String, dynamic> event) async {
    try {
      final message0 = Message.fromEvent(event);
      final message1 = await repo.findById(message0.id!);
      await repo.create(message1);
      return Success(message1);
    } on Exception catch (_) {
      return const Error('fail');
    }
  }
}

class DeleteMessageUseCase {
  DeleteMessageUseCase({required this.repo});

  final MessageRepository repo;

  Future<Result<Message, dynamic>> call(Map<String, dynamic> event) async {
    try {
      final message0 = Message.fromEvent(event);
      final message1 = await repo.findById(message0.id!);
      await repo.delete(message1);
      return Success(message1);
    } on Exception catch (_) {
      return const Error('fail');
    }
  }
}

class GetMessageUseCase {
  GetMessageUseCase({required this.repo});

  final MessageRepository repo;

  Future<Result<List<Message>, dynamic>> call({
    int? cursor,
    int limit = 100,
    bool isForward = false,
  }) async {
    try {
      return const Success([]);
    } on Exception catch (_) {
      return const Error('fail');
    }
  }
}

class UpdateUserUseCase {
  UpdateUserUseCase({required this.repo});

  final UserRepository repo;

  Future<Result<User, dynamic>> call(Map<String, dynamic> event) async {
    try {
      final message0 = Message.fromEvent(event);
      final message1 = await repo.findById(message0.id!);
      return Success(message1);
    } on Exception catch (_) {
      return const Error('fail');
    }
  }
}

class Message {
  Message({required this.id, this.user});

  factory Message.fromEvent(Map<String, dynamic> event) {
    final payload = event['payload'] as Map<String, dynamic>;
    return Message(
      id: payload['id'] as int,
      user: User.fromJson(payload['user'] as Map<String, dynamic>),
    );
  }

  final int id;
  final User? user;

  Message copyWith({int? id, User? user}) =>
      Message(id: id ?? this.id, user: user ?? this.user);
}

class User {
  User({this.id});

  factory User.fromEvent(Map<String, dynamic> event) {
    final payload = event['payload'] as Map<String, dynamic>;
    return User(id: payload['id'] as int);
  }

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json['id'] as int);

  final int? id;
}

class MessageRepository {
  Future<int> create(Message message) => Future.value(1);

  Future<int> update(Message message) => Future.value(1);

  Future<int> delete(Message message) => Future.value(1);

  Future<Message> findById(int id) => Future.value(Message(id: 1));

  Future<List<Message>> findAllBy({
    required int cursor,
    required int limit,
    required bool isForward,
  }) =>
      Future.value([Message(id: 1), Message(id: 2)]);
}

class UserRepository {
  Future<int> create(User user) => Future.value(1);

  Future<int> update(User user) => Future.value(1);

  Future<int> delete(User user) => Future.value(1);

  Future<User> findById(int id) => Future.value(User(id: 1));
}
