import 'package:carousel_slider/carousel_slider.dart';
import 'package:comerce_app/models/category_model.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../widget/carousel_product.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_navbar.dart';
import '../widget/hero_carosel_card.dart';
import '../widget/product_card.dart';
import '../widget/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Zero to Unicorn',
      ),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
                items: Category.categories
                    .map((category) => HeroCarouselCard(category: category))
                    .toList(),
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                )),
          ),
          SectionTitle(
            title: 'RECOMMENDED',
          ),
          ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList()),
           SectionTitle(
            title: 'MOST  POPULAR',
          ),
          ProductCarousel(products: Product.products.where((product) => product.isPopular).toList())

        ],
      ),
    );
  }
}





