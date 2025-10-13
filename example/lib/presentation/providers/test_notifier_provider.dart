import 'package:example/data/test_datasource_service.dart';
import 'package:flutter_toolkit/flutter_toolkit.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

final testNotifierProvider =
    AutoDisposePaginationNotifierProvider<TestPaginationNotifier, String, Null>(
      () {
        return TestPaginationNotifier();
      },
    );

class TestPaginationNotifier
    extends AutoDisposePaginationNotifier<String, Null> {
  late final CustomLogger logger = CustomLogger(owner: runtimeType.toString());

  @override
  Future<PaginatedListResponse<String>> fetchItems(
    Null loadParams,
    Null arg,
    PaginationParams paginationParams,
  ) {
    return TestDatasourceService.instance.fetchItems(paginationParams);
  }

  @override
  PaginationState<String, Null, Null> build() {
    ref.onDispose(
      () {
        logger.log('dispose');
      },
    );
    ref.onCancel(
      () {
        logger.log('cancel');
      },
    );
    logger.log('build');
    return super.build();
  }

  @override
  Null get initialLoadParams => null;
}
