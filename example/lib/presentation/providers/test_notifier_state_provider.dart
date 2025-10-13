import 'package:example/data/test_datasource_service.dart';
import 'package:flutter_toolkit/flutter_toolkit.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

final testNotifierStateProvider =
    AutoDisposePaginationNotifierProvider<
      TestStatePaginationNotifier,
      String,
      int
    >(
      () {
        return TestStatePaginationNotifier();
      },
    );

class TestStatePaginationNotifier
    extends AutoDisposePaginationNotifier<String, int> {
  late final CustomLogger logger = CustomLogger(owner: runtimeType.toString());

  void increment() {
    changeLoadParams(
      throttle: false,
      resetState: false,
      (current) {
        return current + 1;
      },
    );
  }

  @override
  Future<PaginatedListResponse<String>> fetchItems(
    int loadParams,
    Null arg,
    PaginationParams paginationParams,
  ) {
    return TestDatasourceService.instance.fetchItems(paginationParams);
  }

  @override
  PaginationState<String, int, Null> build() {
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
  int get initialLoadParams => 0;
}
