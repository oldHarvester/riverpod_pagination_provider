import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pagination_provider/src/models/paginated_list_response/paginated_list_response.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_page_state/pagination_page_state.dart';
import 'package:riverpod_pagination_provider/src/models/pagination_state/pagination_state.dart';
import 'package:riverpod_pagination_provider/src/utils/pagination_helpers.dart';
import 'package:flutter_toolkit/flutter_toolkit.dart';

import '../models/pagination_page_response/pagination_page_response.dart';
import '../models/pagination_params/pagination_params.dart';
import '../models/pagination_relative_index/pagination_relative_index.dart';
import '../utils/exceptions/pagination_cancel_exception.dart';

part 'pagination_mixin.dart';
part 'pagination_notifier_helper.dart';
part 'notifiers/autodispose_family_notifier.dart';
part 'notifiers/family_notifier.dart';
part 'notifiers/autodispose_notifier.dart';
part 'notifiers/notifier.dart';

enum PaginationUpdateType {
  /// При смене страницы старые страницы очищаются
  clearOthers,

  /// При смене страницы старые загруженные страницы не очищаются но обновляются
  autoUpdateCache,

  /// При смене страницы стырые загруженные страницы не очищаются и не обновляются
  /// Исключением является присутствующая ошибка на странице
  nonUpdateCache,
}

class ExamplePaginationNotifier
    extends AutoDisposePaginationNotifier<List<int>, int> {
  @override
  int get initialLoadParams => 10;

  @override
  Future<PaginatedListResponse<List<int>>> fetchItems(
    int loadParams,
    Null arg,
    PaginationParams paginationParams,
  ) {
    throw UnimplementedError();
  }
}
