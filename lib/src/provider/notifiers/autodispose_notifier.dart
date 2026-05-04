part of '../pagination_provider.dart';

typedef AutoDisposePaginationNotifierProvider<
        NotifierT extends AutoDisposePaginationNotifier<Item, LoadState>,
        Item,
        LoadState>
    = AutoDisposeNotifierProvider<NotifierT,
        PaginationState<Item, LoadState, Null>>;

abstract class AutoDisposePaginationNotifier<Item, LoadState>
    extends AutoDisposeNotifier<PaginationState<Item, LoadState, Null>>
    with
        PaginationNotifierMixin<
            Item,
            LoadState,
            Null,
            AutoDisposeNotifierProviderRef<
                PaginationState<Item, LoadState, Null>>> {
  @override
  bool updateShouldNotify(
    PaginationState<Item, LoadState, Null> previous,
    PaginationState<Item, LoadState, Null> next,
  ) {
    return FlexibleEquality().notEquals(previous, next);
  }

  @override
  PaginationState<Item, LoadState, Null> build() {
    return initiateBuild();
  }

  @override
  Null get arg => null;
}
