part of '../pagination_provider.dart';

typedef AutoDisposePaginationNotifierProvider<
  NotifierT extends AutoDisposePaginationNotifier<T, Z>,
  T,
  Z
> = AutoDisposeNotifierProvider<NotifierT, PaginationState<T, Z, Null>>;

abstract class AutoDisposePaginationNotifier<T, Z>
    extends AutoDisposeNotifier<PaginationState<T, Z, Null>>
    with PaginationNotifierMixin<T, Z, Null> {
  @override
  PaginationState<T, Z, Null> readState() => super.state;

  @override
  PaginationState<T, Z, Null>? readStateOrNull() => super.stateOrNull;

  @override
  Ref<PaginationState<T, Z, Null>> readRefence() => super.ref;

  @override
  Null readArgs() => null;

  @override
  void changeState(PaginationState<T, Z, Null> newState) {
    if (stateOrNull != newState) {
      super.state = newState;
    }
  }

  @override
  PaginationState<T, Z, Null> build() {
    return initiateBuild();
  }
}
