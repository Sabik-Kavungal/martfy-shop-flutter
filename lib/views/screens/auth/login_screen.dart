import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/models/user_model.dart';
import 'package:martfy/views/screens/admin/addProduct.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/home/home_screen.dart';
import 'package:martfy/views/screens/mainScreen/main_screen.dart';
import 'package:martfy/views/widgets/custom_button.dart';
import 'package:martfy/views/widgets/custom_textield.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';

  LoginScreen({Key? key}) : super(key: key);

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVM>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background_image.jpg'), // Add your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 3.0,
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5),
                    CustomTextField(
                      value: vm.user.email ?? '',
                      hintText: 'Email...',
                      prefixIcon: const Icon(Icons.email),
                      focusNode: _emailNode,
                      onChange: (value) {
                        vm.user = vm.user.copyWith(email: value);
                      },
                    ),
                    SizedBox(height: 5),
                    CustomTextField(
                      value: vm.user.password ?? '',
                      hintText: 'Password...',
                      prefixIcon: const Icon(Icons.lock),
                      focusNode: _passwordNode,
                      onChange: (value) {
                        vm.user = vm.user.copyWith(password: value);
                      },
                    ),
                    SizedBox(height: 5),
                    CustomButton(
                      color: Colors.blue,
                      onClick: () {
                        vm.login((success) async {
                          if (success) {
                            final userType = LocalDatabaseService().fromDb(
                                await LocalDatabaseService()
                                    .openBox("userType"),
                                'key');

                            if (userType == 'user') {
                              print(userType);
                              Navigator.pushReplacementNamed(
                                context,
                                MainScreenxxx.routeName,
                              );
                            } else if (userType == 'admin') {
                              print(userType);
                              Navigator.pushReplacementNamed(
                                context,
                                AddProductScreen.routeName,
                              );
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Login successful'),
                              backgroundColor: Colors.green,
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Login failed'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        });
                      },
                      name: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
