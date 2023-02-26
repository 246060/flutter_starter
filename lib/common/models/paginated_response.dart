class PaginatedResponse<T> {
  PaginatedResponse({
    this.page = 1,
    this.results = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json, {
    required List<T> results,
  }) {
    return PaginatedResponse<T>(
      page: json['page'] as int,
      results: results,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }

  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;
}
