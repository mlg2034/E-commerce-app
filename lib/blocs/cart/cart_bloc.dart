import 'package:bloc/bloc.dart';
import 'package:comerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);

    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }
  void _onLoadCart(event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(event, Emitter<CartState> emit) {
    final state = this.state;
    if(state is CartLoaded){
      try{
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product)
          )
        ));
      }catch(_){
        emit(CartError());
      }
    }
  }
  void _onRemoveProduct(event, Emitter<CartState> emit) {
      final state = this.state;
    if(state is CartLoaded){
      try{
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product)
          )
        ));
      }catch(_){
        emit(CartError());
      }
    }
  }
}
