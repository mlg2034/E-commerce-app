import 'package:comerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  Cart({this.products=const <Product> []});
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);
  double deliveryFree(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You Have Free delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }
  double total(subtotal , deliveryFree){
     return subtotal + deliveryFree(subtotal);
  }
  String get totalString =>total(subtotal, deliveryFree).toStringAsFixed(2);
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliberyFreeString => deliveryFree(subtotal).toStringAsFixed(2);
  String get freeDeliveryString=>freeDelivery(subtotal);
  
  @override
  List<Object?> get props => [products];
}
