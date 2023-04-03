class Pagination {
  Pagination({this.limit = 10, this.offset = 0, this.total = 0});

  final int limit;
  final int offset;
  final int total;
}
