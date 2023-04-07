// mongodb find 검색 조건 참조

class Filter {
  Filter({required this.conditions});

  final Map<dynamic, dynamic> conditions;

  @override
  String toString() => 'filter: $conditions';
}

