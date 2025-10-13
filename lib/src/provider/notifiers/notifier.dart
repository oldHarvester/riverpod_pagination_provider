part of '../pagination_provider.dart';

typedef PaginationNotifierProvider<
  NotifierT extends PaginationNotifier<T, Z>,
  T,
  Z
> = NotifierProvider<NotifierT, PaginationState<T, Z, Null>>;

abstract class PaginationNotifier<T, Z>
    extends Notifier<PaginationState<T, Z, Null>>
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
    super.state = newState;
  }

  @override
  PaginationState<T, Z, Null> build() {
    return initiateBuild();
  }
}
