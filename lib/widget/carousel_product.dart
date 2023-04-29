import 'package:comerce_app/widget/product_card.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      
      child: ListView.builder(
        itemCount: Product.products.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          
         return Padding(
     padding: const EdgeInsets.only(right: 5.0),
     child: ProductCard(product: Product.products[index],),
         );

      }),
    );
  }
}