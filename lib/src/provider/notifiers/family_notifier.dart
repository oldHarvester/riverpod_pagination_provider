part of '../pagination_provider.dart';

typedef PaginationNotifierProviderFamily<
        NotifierT extends PaginationFamilyNotifier<Item, LoadState, Arg>, Item, LoadState, Arg>
    = NotifierProviderFamily<NotifierT, PaginationState<Item, LoadState, Arg>, Arg>;

abstract class PaginationFamilyNotifier<Item, LoadState, Arg>
    extends FamilyNotifier<PaginationState<Item, LoadState, Arg>, Arg>
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
