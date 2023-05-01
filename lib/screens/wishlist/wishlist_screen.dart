import 'package:comerce_app/models/models.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_app_bar.dart';
import '../../widget/custom_navbar.dart';
import '../../widget/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName ='/wishlist';
  static Route route(){
    return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_)=>WishlistScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'WishList',
      ),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            itemCount: Product.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: ProductCard(
                product:Product.products[index],
                widthFactor: 1.1,
                leftPosition: 30,
                isWishList: true,
              ));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.15,
            ))
,
    );
  }
}
