import 'package:example/data/test_datasource_service.dart';
import 'package:flutter_toolkit/flutter_toolkit.dart';
import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

final testNotifierFamilyProvider =
    PaginationNotifierProviderFamily<
      TestPaginationFamilyNotifier,
      String,
      Null,
      int
    >(
      () {
        return TestPaginationFamilyNotifier();
      },
    );

class TestPaginationFamilyNotifier
    extends PaginationFamilyNotifier<String, Null, int> {
  late final CustomLogger logger = CustomLogger(owner: '${runtimeType}_$arg');

  @override
  Future<PaginatedListResponse<String>> fetchItems(
    Null loadParams,
    int? arg,
    PaginationParams paginationParams,
  ) async {
    return TestDatasourceService.instance.fetchItems(paginationParams);
  }

  @override
  Null get initialLoadParams => null;

  @override
  PaginationState<String, Null, int> build(int arg) {
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
    return super.build(arg);
  }
}
