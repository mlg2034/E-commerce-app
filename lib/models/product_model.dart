import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});
  @override
  List<Object?> get props =>
      [name, price, category, imageUrl, isRecommended, isPopular];
      static List<Product> products = [
        
      ];
}
