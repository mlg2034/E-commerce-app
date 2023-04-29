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
    Product(
        name: 'Soft Drinks #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://i.pinimg.com/originals/b3/c3/19/b3c3198adb7d53a156704c2cf6a273ca.jpg',
        price: 3.9,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'Soft Drinks #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://i.pinimg.com/originals/b3/c3/19/b3c3198adb7d53a156704c2cf6a273ca.jpg',
        price: 3.9,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Soft Drinks #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://i.pinimg.com/originals/b3/c3/19/b3c3198adb7d53a156704c2cf6a273ca.jpg',
        price: 3.9,
        isRecommended: false,
        isPopular: true)
  ];
}
