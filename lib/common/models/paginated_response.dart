class PaginatedResponse {
  PaginatedResponse({
    this.page = 1,
    this.results = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });

  PaginatedResponse.fromJson(Map<String, dynamic> json)
      : page = json["page"] as int,
        results = json["results"] as List<Map<String, dynamic>>,
        totalPages = json["total_pages"] as int,
        totalResults = json["total_results"] as int;

  final int page;
  final List<Map<String, dynamic>> results;
  final int totalPages;
  final int totalResults;
}
