import 'package:flutter/material.dart';
import 'package:martfy/views/screens/admin/addProduct.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/auth/register.screen.dart';
import 'package:martfy/views/screens/home/home_screen.dart';

import '../models/product_model.dart';
import '../views/screens/auth/auth_screen.dart';
import '../views/screens/home/categoryDealsScreen.dart';
import '../views/screens/home/product_detail.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginScreen(),
      );
    case RegistrationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RegistrationScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case ChangePasswordPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChangePasswordPage(),
      );
    case UpdateProfilePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UpdateProfilePage(),
      );

    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen(),
      );

    case HomeScreenP.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreenP(category: category),
      );
    case ProductDetail.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetail(
          product: product,
        ),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
