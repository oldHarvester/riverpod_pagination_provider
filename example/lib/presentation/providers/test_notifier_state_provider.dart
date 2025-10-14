// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:example/data/test_datasource_service.dart';
import 'package:flutter_toolkit/flutter_toolkit.dart';

import 'package:riverpod_pagination_provider/riverpod_pagination_provider.dart';

final testNotifierStateProvider =
    AutoDisposePaginationNotifierProvider<
      TestStatePaginationNotifier,
      String,
      TestStatePaginationValue
    >(
      () {
        return TestStatePaginationNotifier();
      },
    );

class TestStatePaginationValue extends Equatable {
  const TestStatePaginationValue({
    required this.loadItems,
  });

  final int loadItems;

  TestStatePaginationValue copyWith({
    int? loadItems,
  }) {
    return TestStatePaginationValue(
      loadItems: loadItems ?? this.loadItems,
    );
  }

  @override
  List<Object?> get props => [loadItems];
}

class TestStatePaginationNotifier
    extends AutoDisposePaginationNotifier<String, TestStatePaginationValue> {
  late final CustomLogger logger = CustomLogger(owner: runtimeType.toString());

  @override
  Future<PaginatedListResponse<String>> fetchItems(
    TestStatePaginationValue loadParams,
    Null arg,
    PaginationParams paginationParams,
  ) async {
    return TestDatasourceService.instance.fetchItems(
      paginationParams,
      loadItems: loadParams.loadItems,
    );
  }

  @override
  PaginationState<String, TestStatePaginationValue, Null> build() {
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
  TestStatePaginationValue get initialLoadParams => TestStatePaginationValue(
    loadItems: 100,
  );
}
