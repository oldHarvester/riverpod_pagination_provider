import 'package:example/utils/list_extension.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

final class TestDatasourceService {
  TestDatasourceService._();

  static TestDatasourceService instance = TestDatasourceService._();

  final List<String> _items = List.generate(
    100,
    (index) {
      return 'Hello World: $index';
    },
  );

  Future<PaginatedListResponse<String>> fetchItems(
    PaginationParams params,
  ) async {
    return Future.delayed(
      Duration(milliseconds: 200),
      () {
        return PaginatedListResponse(
          results: _items.paginated(
            limit: params.limit,
            offset: params.offset,
          ),
          totalCount: _items.length,
        );
      },
    );
  }
}
