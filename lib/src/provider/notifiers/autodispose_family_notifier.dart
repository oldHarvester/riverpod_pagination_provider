part of '../pagination_provider.dart';

typedef AutoDisposePaginationNotifierProviderFamily<
  NotifierT extends AutoDisposePaginationFamilyNotifier<T, Z, Y>,
  T,
  Z,
  Y
> = AutoDisposeNotifierProviderFamily<NotifierT, PaginationState<T, Z, Y>, Y>;

abstract class AutoDisposePaginationFamilyNotifier<T, Z, Y>
    extends AutoDisposeFamilyNotifier<PaginationState<T, Z, Y>, Y>
    with PaginationNotifierMixin<T, Z, Y> {
  @override
  PaginationState<T, Z, Y> readState() => super.state;

  @override
  PaginationState<T, Z, Y>? readStateOrNull() => super.stateOrNull;

  @override
  Ref<PaginationState<T, Z, Y>> readRefence() => super.ref;

  @override
  Y readArgs() => arg;

  @override
  Future<PaginatedListResponse<T>> fetchItems(
    Z loadParams,
    covariant Y arg,
    PaginationParams paginationParams,
  );

  @override
  void changeState(PaginationState<T, Z, Y> newState) {
    if (stateOrNull != newState) {
      super.state = newState;
    }
  }

  @override
  PaginationState<T, Z, Y> build(Y arg) {
    return initiateBuild();
  }
}
