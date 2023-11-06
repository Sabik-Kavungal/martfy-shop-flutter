import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:martfy/views/widgets/custom_refresh.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Home"),
      ),
      body: Consumer<HomeVM>(
        builder: (context, authVM, child) {
          if (authVM.isLoading) {
            return const Center(
              child: SpinKitDoubleBounce(
                color: Colors.blue,
                size: 78.0,
              ),
            );
          } else if (authVM.user == null) {
            return const Center(
              child: Text('No data available.'),
            );
          } else {
            return CustomRefresh(
              onRefresh: () {
                return authVM.getProfile();
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Background color for the avatar
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white, // Color of the person icon
                        size: 80,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Hello, ${authVM.user?.name}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Email: ${authVM.user?.email}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<AuthVM>(context, listen: false)
                            .logoutUser();
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Text(
                        "Log Out",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
