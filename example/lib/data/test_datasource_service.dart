import 'dart:math';

import 'package:example/utils/list_extension.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

final class TestDatasourceService {
  TestDatasourceService._();

  static TestDatasourceService instance = TestDatasourceService._();

  List<String> _prepareItems(int length) {
    return List.generate(
      length,
      (index) {
        return 'Hello World: $index';
      },
    );
  }

  Future<PaginatedListResponse<String>> fetchItems(
    PaginationParams params, {
    int loadItems = 100,
    bool loadRandom = false,
  }) async {
    final randomItems = Random().nextInt(100) + 50;
    return Future.delayed(
      Duration(milliseconds: 200),
      () {
        final items = _prepareItems(loadRandom ? randomItems : loadItems);
        return PaginatedListResponse(
          results: items.paginated(
            limit: params.limit,
            offset: params.offset,
          ),
          totalCount: items.length,
        );
      },
    );
  }
}
