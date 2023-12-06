import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/models/user_model.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/widgets/custom_button.dart';
import 'package:martfy/views/widgets/custom_text.dart';
import 'package:martfy/views/widgets/custom_textield.dart';
import 'package:provider/provider.dart';
class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration-screen';

  RegistrationScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVM>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
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
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // CircleAvatar(
                    //   radius: 40,
                    //   backgroundImage: AssetImage('assets/logo.png'), // Your logo or icon
                    // ),
                    // SizedBox(height: 16),
                    // Text(
                    //   'Register an Account',
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(height: 5),
                    CustomTextField(
                      focusNode: _nameNode,
                      value: vm.user.name ?? '',
                      hintText: 'Username...',
                      onChange: (value) {
                        vm.user = vm.user.copyWith(name: value);
                      },
                      prefixIcon: const Icon(Icons.person),
                    ),
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
                        vm.register((success) {
                          if (success) {
                            Navigator.pushNamed(context, LoginScreen.routeName)
                                .then((value) {
                              xmToast('Successfully registered', Colors.green);
                            });
                          } else {
                            xmToast('Registration Failed', Colors.red);
                          }
                        });
                      },
                      name: 'Register',
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