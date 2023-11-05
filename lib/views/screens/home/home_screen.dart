import 'package:flutter/material.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Consumer<AuthVM>(
        builder: (context,authVM,child) {
          return Center(
            child: Text(authVM.user!.name.toString()),
          );
        }
      ),
    );
  }
}
