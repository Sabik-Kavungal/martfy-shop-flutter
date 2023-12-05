import 'package:flutter/material.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/auth/register.screen.dart';
import 'package:martfy/views/screens/home/home_screen.dart';

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
        builder: (_) =>  HomeScreen(),
      );
       case ChangePasswordPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  ChangePasswordPage(),
      );
       case UpdateProfilePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  UpdateProfilePage(),
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
