import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgUrl;
  const Category({required this.imgUrl, required this.name});

  @override
  List<Object?> get props => [name, imgUrl];
  static List<Category> categories = [
    Category(
        imgUrl:
            'https://images.saymedia-content.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTkxODQ5MTA0ODMyNDcyNTYy/dark-reality-of-cold-drinks.jpg',
        name: 'Soft Drinks'),
    Category(
        imgUrl:
            'https://andianne.com/wp-content/uploads/2021/04/smoothies-07.jpg',
        name: 'Smoothies'),
    Category(
        imgUrl:
            'https://5.imimg.com/data5/TE/DM/MY-44148833/1-liter-mineral-water-bottles-500x500.jpg',
        name: 'water')
  ];
}
