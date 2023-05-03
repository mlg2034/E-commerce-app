import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/wishlist_bloc.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../widget/cart_product_card.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_navbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    'GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.displaySmall,
                  ))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Cart().freeDeliveryString,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Text(
                          'Add More Items',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(),
                            elevation: 0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: Cart().product.length,
                      itemBuilder:(context , index){
                        return  CartProductCard(
                    product: Cart().product[index],
                  );
                    } ),
                  ),
                
                ],
              ),
              Column(
                children: [
                  const Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SUBTOTAL',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              '\$${Cart().subtotalString}',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DELIVERY FREE',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              '\$${Cart().deliberyFreeString}',
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration:
                            BoxDecoration(color: Colors.black.withAlpha(50)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(5.0),
                        height: 50,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOTAL',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                               '\$${ Cart().totalString}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
