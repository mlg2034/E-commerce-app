import 'package:comerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

import '../screens/wishlist/wishlist_screen.dart';


class AppRoute{
  static Route onGenereateRoute(RouteSettings settings){
    print("This is route: ${settings.name}");

    switch(settings.name){
      case '/':
      return HomeScreen.route();
    case CartScreen.routeName:
    return CartScreen.route();
    case ProductScreen.routeName:
    return ProductScreen.route();
    case WishlistScreen.routeName:
    return WishlistScreen.route();
    case CatalogScreen.routeName:
    return CatalogScreen.route();
    default:
    return _errorRoute();
    }
  }
  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_)=>Scaffold(appBar: AppBar(title: Text('Error'),),));
  }
}