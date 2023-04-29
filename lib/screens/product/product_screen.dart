import 'package:flutter/material.dart';

import '../../widget/custom_app_bar.dart';
import '../../widget/custom_navbar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static const String routeName ='/product';
  static Route route(){
    return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_)=>ProductScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product',
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
