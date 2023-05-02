import 'package:comerce_app/blocs/bloc/wishlist_bloc.dart';
import 'package:comerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/custom_app_bar.dart';
import '../../widget/custom_navbar.dart';
import '../../widget/product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'WishList',
      ),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
         if(state is WishListLoading){
         return const Center(child: CircularProgressIndicator());
         }
          if(state is WishListLoaded){
            return   GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              itemCount: state.wishList.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: ProductCard(
                  product: state.wishList.products[index],
                  widthFactor: 1.1,
                  leftPosition: 30,
                  isWishList: true,
                ));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.15,
              ),
              
              );
          }
              else{
                return Center(child: Text('Something Went Wrong' , style: Theme.of(context).textTheme.bodyLarge,));
              }

        },
      ),
    );
  }
}
