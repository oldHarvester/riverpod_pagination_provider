extension ListExtension<T> on Iterable<T> {
  List<T> paginated({int limit = 10, int offset = 0}) {
    final items = toList();
    if (offset < 0) offset = 0;
    if (limit <= 0) return [];
    if (offset >= items.length) return [];
    final end = (offset + limit) > items.length ? items.length : offset + limit;
    return items.sublist(offset, end);
  }
}
