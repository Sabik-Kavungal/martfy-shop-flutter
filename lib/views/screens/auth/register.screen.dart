import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                color: Colors.blue,
                onClick: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final name = _nameController.text;

                  final userVM = Provider.of<AuthVM>(context, listen: false);
                  final user =
                      User(name: name, email: email, password: password);

                  userVM.register(user, (success) {
                    if (success) {
                      Navigator.pushNamed(context, LoginScreen.routeName);

                      Fluttertoast.showToast(
                        msg: 'Successfully registred',
                        backgroundColor: Colors.green,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    } else {
                      // Handle the case when the login fails.
                      Fluttertoast.showToast(
                        msg: 'regitration Failed',
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    }
                  });
                },
                name: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
