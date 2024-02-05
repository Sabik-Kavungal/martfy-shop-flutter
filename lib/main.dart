import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/route.dart';
import 'package:martfy/views/screens/admin/addProduct.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/auth_screen.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:martfy/views/screens/mainScreen/mainVM.dart';
import 'package:martfy/views/screens/mainScreen/main_screen.dart';
import 'package:provider/provider.dart';

import 'constants/them.dart';

void main() async {
  await Hive.initFlutter();
  final token = LocalDatabaseService()
      .fromDb(await LocalDatabaseService().openBox("token"), 'key');
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthVM(),
        ),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => HomeVM())
      ],
      child: MyApp(
        saved: token,
      )));
}

class MyApp extends StatelessWidget {
  final String? saved;

  const MyApp({super.key, this.saved});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARTFY',
      theme: CustomColorTheme.buildTheme(),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: FutureBuilder<String?>(
        future: check(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final userType = snapshot.data;
            print("User type: $userType");

            return saved != null
                ? userType == 'user'
                    ? MainScreenxxx()
                    : const AddProductScreen()
                : AuthScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }

  Future<String?> check() async {
    try {
      // Open the box named "userType"
      final userTypeBox = await LocalDatabaseService().openBox("userType");

      // Retrieve the value associated with the key 'key'
      final userType = LocalDatabaseService().fromDb(userTypeBox, 'key');
      print('User Type: $userType');
      return userType;
    } catch (e) {
      print('Error during userType check: $e');
      return null; // Handle error gracefully, return null or a default value
    }
  }
}
