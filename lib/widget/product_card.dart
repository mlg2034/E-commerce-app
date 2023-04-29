import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150,
          child: Image.network(
            Product.products[0].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 5,
          top: 95,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 60,
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                   Text(
                        "\$${Product.products[0].price}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                     
                    ],
                  ),
                ),
                 Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle , color: Colors.white,)))
              ],
            ),
          ),
        )
      ],
    );
  }}