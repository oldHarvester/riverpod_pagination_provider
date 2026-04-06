part of '../pagination_provider.dart';

typedef PaginationNotifierProvider<
        NotifierT extends PaginationNotifier<Item, LoadState>, Item, LoadState>
    = NotifierProvider<NotifierT, PaginationState<Item, LoadState, Null>>;

abstract class PaginationNotifier<Item, LoadState>
    extends Notifier<PaginationState<Item, LoadState, Null>>
    with
        PaginationNotifierMixin<Item, LoadState, Null,
            NotifierProviderRef<PaginationState<Item, LoadState, Null>>> {
  @override
  PaginationState<Item, LoadState, Null> build() {
    return initiateBuild();
  }

  @override
  Null get arg => null;
}
