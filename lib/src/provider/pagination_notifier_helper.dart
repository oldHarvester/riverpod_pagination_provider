part of 'pagination_provider.dart';

abstract class PaginationNotifierHelper<T, Z, Y> {
  @protected
  Z get initialLoadParams;

  @protected
  Y? readArgs();

  @protected
  Ref<PaginationState<T, Z, Y>> readRefence();

  @protected
  PaginationState<T, Z, Y>? readStateOrNull();

  @protected
  PaginationState<T, Z, Y> readState();

  @protected
  Ref<PaginationState<T, Z, Y>> get ref => readRefence();

  PaginationState<T, Z, Y> get state => readState();

  @protected
  PaginationState<T, Z, Y>? get stateOrNull => readStateOrNull();

  @protected
  void changeState(PaginationState<T, Z, Y> newState);
}
