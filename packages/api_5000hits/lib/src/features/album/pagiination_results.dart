class PaginationResult<T> {
  final List<T> items;
  final int totalCount;
  final int currentPage;
  final int pageSize;

  PaginationResult({
    required this.items,
    required this.totalCount,
    required this.currentPage,
    required this.pageSize,
  });

  bool get hasNextPage => currentPage * pageSize < totalCount;
}