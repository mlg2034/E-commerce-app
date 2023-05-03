import 'package:comerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishListLoading()){
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishList>(_onAddProductToWishList);
    on<RemoveProductFromWishList>(_onRemoveProductFromWishList);
  }
  void _onLoadWishlist(event , Emitter<WishlistState> emitter) async{
      emit( WishListLoading());
    try {
      await Future<void>.delayed( const Duration(seconds: 1));
      emit( const WishListLoaded());
    } catch(_){
      emit(WishListError());
    }
  }
  void _onAddProductToWishList(event , Emitter<WishlistState> emitter){
    final state = this.state;
     if (state is WishListLoaded) {
      try {
        emit( WishListLoaded(wishList: WishList(products: List.from(state.wishList.products)..add(event.product))));
      } on Exception{
        emit(WishListError());
      }
    }
  }
  void _onRemoveProductFromWishList(event , Emitter<WishlistState> emitter){
      final state = this.state;
     if (state is WishListLoaded) {
      try {
        emit( WishListLoaded(wishList: WishList(products: List.from(state.wishList.products)..remove(event.product))));
      } on Exception{
        emit(WishListError());
      }
    }
  }




}