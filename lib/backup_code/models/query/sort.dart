enum Direction { desc, asc }

class Sort {
  Sort({required this.field, required this.direction});

  final String field;
  final Direction direction;
}