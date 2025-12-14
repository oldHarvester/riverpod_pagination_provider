part of '../pagination_provider.dart';

typedef PaginationNotifierProviderFamily<
  NotifierT extends PaginationFamilyNotifier<T, Z, Y>,
  T,
  Z,
  Y
> = NotifierProviderFamily<NotifierT, PaginationState<T, Z, Y>, Y>;

abstract class PaginationFamilyNotifier<T, Z, Y>
    extends FamilyNotifier<PaginationState<T, Z, Y>, Y>
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
  void changeState(PaginationState<T, Z, Y> newState) {
    if (stateOrNull != newState) {
      super.state = newState;
    }
  }

  @override
  Future<PaginatedListResponse<T>> fetchItems(
    Z loadParams,
    covariant Y arg,
    PaginationParams paginationParams,
  );

  @override
  PaginationState<T, Z, Y> build(Y arg) {
    return initiateBuild();
  }
}
