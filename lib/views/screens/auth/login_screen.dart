import 'package:flutter/material.dart';
import 'package:martfy/views/widgets/custom_button.dart';
import 'package:martfy/views/widgets/custom_textield.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: _emailController,
                hintText: 'email...',
                prefixIcon: const Icon(Icons.email),
                focusNode: _emailNode,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'password...',
                prefixIcon: const Icon(Icons.lock),
                focusNode: _passwordNode,
              ),
              CustomButton(color: Colors.blue, onClick: () {}, name: 'Login'),
              // GlobalVariables.mheight,
            ],
          ),
        ),
      ),
    );
  }
}
