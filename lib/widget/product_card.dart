import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final double widthFactor;
  final Product product;
  final double leftPosition;
  final bool isWishList;
  const ProductCard({
    this.isWishList = false,
    this.leftPosition = 5,
    this.widthFactor = 2.5,
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 180,
            child: Image.network(
              Product.products[0].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: leftPosition,
              top: 60,
              child: Container(
                width: widthValue - 5 - leftPosition,
                height: 70,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              )),
          Positioned(
            left: leftPosition + 5,
            top: 65,
            child: Container(
              width: widthValue - 15 - leftPosition,
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
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                          child: IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(AddProduct(product));
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        return Center(child: Text('SOMETHING WENT WRONG'));
                      }
                    },
                  ),
                  isWishList
                      ? Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
