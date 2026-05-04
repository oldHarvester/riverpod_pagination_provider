part of 'pagination_provider.dart';

abstract class PaginationNotifierHelper<Item, LoadState, Arg,
    PaginationRef extends Ref<PaginationState<Item, LoadState, Arg>>> {
  @protected
  LoadState get initialLoadParams;

  @protected
  Arg? get arg;

  @protected
  PaginationRef get ref;

  @protected
  PaginationState<Item, LoadState, Arg>? get stateOrNull;

  @protected
  PaginationState<Item, LoadState, Arg> get state;

  @protected
  set state(PaginationState<Item, LoadState, Arg> state);
}
