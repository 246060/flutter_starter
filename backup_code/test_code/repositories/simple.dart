import 'package:app_common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../backup_code/models/query/filter.dart';
import '../../../backup_code/models/query/operator.dart';
import '../../../backup_code/models/query/pagination.dart';
import '../../../backup_code/models/query/projection.dart';
import '../../../backup_code/models/query/sort.dart';
import '../../../backup_code/repositories/common/repository.dart';
import 'simple.mocks.dart';

enum DogFields with Projection, DataFields { id, age }

class Dog {}

class SampleRepository extends LocalRepository<Dog> {
  SampleRepository({required this.client});

  final dynamic client;

  @override
  Future<void> init() => Future.value();

  @override
  Future<List<Dog>> findAll({
    Filter? filter,
    List<Projection> projections = const [],
    List<Sort> sorts = const [],
    Pagination? pagination,
  }) {
    log.i(filter);
    return Future.value([Dog()]);
  }

  @override
  Future<Dog> findById({
    required int id,
    List<Projection> projections = const [],
  }) {
    log.i(projections);
    return Future(Dog.new);
  }

  @override
  Future<int> create({required Dog t}) => Future.value(1);

  @override
  Future<int> delete({Filter? filter}) => Future.value(1);

  @override
  Future<int> update({required Dog t, Filter? filter}) => Future.value(1);

  @override
  Future<int> count({Filter? filter}) => Future.value(1);

  @override
  Future<void> close() => throw UnimplementedError();
}

@GenerateMocks([Box, HiveInterface])
void main() {
  setUp(() async {});

  group('sample group', () {
    test('sample test 1', () async {
      //
      final HiveInterface hive = MockHiveInterface();

      when(
        hive.openBox<Map<dynamic, dynamic>>('user'),
      ).thenAnswer(
        (_) async => Future.value(MockBox<Map<dynamic, dynamic>>()),
      );

      final repo = SampleRepository(
        client: await hive.openBox<Map<dynamic, dynamic>>('user'),
      );

      await repo.findById(
        id: 1,
        projections: [
          DogFields.id,
          DogFields.age,
        ],
      );

      await repo.findAll(
        filter: Filter(
          conditions: <dynamic, dynamic>{
            FilterOperator.$or: [
              {DogFields.age: 20},
              {DogFields.age: 10}
            ]
          },
        ),
      );
    });
  });
}
