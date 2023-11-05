import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/route.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/auth_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  LocalDB localDB = LocalDB();
  localDB.openBox('token');
  final boxOpen = await localDB.openBox("token");
  final a = localDB.getData(boxOpen, 'key');
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthVM())],
      child: MyApp(
        token: a,
      )));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARTFY',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AuthScreen(),
    );
  }
}
