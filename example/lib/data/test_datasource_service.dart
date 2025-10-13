import 'package:example/utils/list_extension.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

final class TestDatasourceService {
  final List<String> _items = List.generate(
    100,
    (index) {
      return 'Hello World: $index';
    },
  );

  Future<List<String>> fetchItems(PaginationParams params) async {
    return Future.delayed(
      Duration(milliseconds: 200),
      () {
        return _items.paginated(
          limit: params.limit,
          offset: params.offset,
        );
      },
    );
  }
}
