enum Direction { desc, asc }

class Sort {
  Sort({required this.field, required this.direction});

  final String field;
  final Direction direction;
}

class Pagination {
  Pagination({this.limit = 10, this.offset = 0, this.total = 0});

  final int limit;
  final int offset;
  final int total;
}

class Query {
  Query({required this.field, required this.value});

  final String field;
  final dynamic value;
}
