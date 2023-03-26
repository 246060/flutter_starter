import 'package:flutter_starter/common/models/pagination.dart';

abstract class Repository<T> {
  Future<T> findById(int id);

  Future<T> findOneBy({required List<Query> where});

  Future<List<T>> findAllBy({
    List<Query>? where,
    Pagination? pagination,
    List<Sort>? sorts,
  });

  Future<int> save(T t);

  Future<void> update(T t);

  Future<void> delete(int id);
}
