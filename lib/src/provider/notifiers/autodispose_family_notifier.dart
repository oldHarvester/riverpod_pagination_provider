part of '../pagination_provider.dart';

typedef AutoDisposePaginationNotifierProviderFamily<
        NotifierT extends AutoDisposePaginationFamilyNotifier<Item, LoadState, Arg>, Item, LoadState, Arg>
    = AutoDisposeNotifierProviderFamily<NotifierT, PaginationState<Item, LoadState, Arg>, Arg>;

abstract class AutoDisposePaginationFamilyNotifier<Item, LoadState, Arg>
    extends AutoDisposeFamilyNotifier<PaginationState<Item, LoadState, Arg>, Arg>
    with
        PaginationNotifierMixin<Item, LoadState, Arg,
            NotifierProviderRef<PaginationState<Item, LoadState, Arg>>> {
  @override
  Future<PaginatedListResponse<Item>> fetchItems(
    LoadState loadParams,
    covariant Arg arg,
    PaginationParams paginationParams,
  );

  @override
  PaginationState<Item, LoadState, Arg> build(Arg arg) {
    return initiateBuild();
  }
}
