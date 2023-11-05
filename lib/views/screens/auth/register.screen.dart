import 'package:flutter/material.dart';
import 'package:martfy/views/widgets/custom_button.dart';
import 'package:martfy/views/widgets/custom_text.dart';
import 'package:martfy/views/widgets/custom_textield.dart';

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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                  focusNode: _nameNode,
                  controller: _nameController,
                  hintText: 'username...',
                  prefixIcon: const Icon(Icons.person)),
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
              CustomButton(
                  color: Colors.blue, onClick: () {}, name: 'Register'),
            ],
          ),
        ),
      ),
    );
  }
}
