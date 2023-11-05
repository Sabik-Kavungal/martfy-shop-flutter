import 'package:flutter/material.dart';
import 'package:martfy/helper/route.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/auth_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthVM())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARTFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:  AuthScreen(),
    );
  }
}
