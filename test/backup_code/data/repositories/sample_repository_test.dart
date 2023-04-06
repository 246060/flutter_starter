import 'package:dio/dio.dart';
import 'package:flutter_starter/extra/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'sample_repository_test.mocks.dart';

Future<String> getLocalDatabasePath() async =>
    join(await getDatabasesPath(), 'sqlite.db');

Future<Database> database(String path) => openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE a(id INTEGER PRIMARY KEY, name TEXT)');
        await db.execute('CREATE TABLE b(id INTEGER PRIMARY KEY, name TEXT)');
        await db.execute('CREATE TABLE c(id INTEGER PRIMARY KEY, name TEXT)');
        log.i('table created');
      },
      version: 1,
    );

class SampleRepository {
  SampleRepository({
    required dynamic remoteClient,
    required dynamic localClient,
  })  : _http = remoteClient as Dio,
        _sql = localClient as Database;

  final Dio _http;
  final Database _sql;

  Future<String> token() async {
    final response =
        await _http.get<Map<String, dynamic>>('https://reqres.in/api/users/1');
    return response.data?['token'] as String;
  }

  Future<int> create() async {
    final id = await _sql.insert('a', {'name': 'user1'});
    final List<Map<String, dynamic>> maps = await _sql.query('a');
    log.i(maps);
    return id;
  }
}

@GenerateMocks([Dio, Database])
void main() {
  late final Dio dio = MockDio();
  late final Database database = MockDatabase();

  late SampleRepository repo;

  setUp(() async {
    // sqfliteFfiInit();
    // databaseFactory = databaseFactoryFfi;

    repo = SampleRepository(
      remoteClient: dio,
      localClient: database,
    );
  });

  group('sample repository remote datasource', () {
    test('return token', () async {
      // given
      when(
        dio.get<Map<String, dynamic>>('https://reqres.in/api/users/1'),
      ).thenAnswer(
        (_) async => Future.value(
          Response(
            statusCode: 200,
            data: {'token': 'ASjwweiBE'},
            requestOptions:
                RequestOptions(path: 'https://reqres.in/api/users/1'),
          ),
        ),
      );

      // when
      final token = await repo.token();

      // then
      expect(token, 'ASjwweiBE');
    });
  });

  group('sample repository local datasource', () {
    test('insert', () async {
      //given
      when(database.insert('a', {'name': 'user1'}))
          .thenAnswer((_) => Future.value(1));

      when(database.query('a')).thenAnswer(
        (_) => Future.value([
          {'name': 'user2'}
        ]),
      );

      //when
      final id = await repo.create();
      log.i(id);

      //then
    });
  });
}
