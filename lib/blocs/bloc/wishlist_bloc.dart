import 'package:comerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishListLoading());

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishlistProductToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishListLoading();
    try {
      await Future<void>.delayed( const Duration(seconds: 1));
      yield const WishListLoaded();
    } catch (_) {
    }
  }

  Stream<WishlistState> _mapAddWishlistProductToState(
      AddWishlistProduct event, WishlistState state) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(wishList: WishList(products: List.from(state.wishList.products)..add(event.product)));
      } catch (_) {
      }
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProductToState(
      RemoveWishlistProduct event, WishlistState state) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(wishList: WishList(products: List.from(state.wishList.products)..remove(event.product)));
      } catch (_) {
      }
    }
  }
}
