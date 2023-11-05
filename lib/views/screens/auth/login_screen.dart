import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:martfy/models/user_model.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/home/home_screen.dart';
import 'package:martfy/views/widgets/custom_button.dart';
import 'package:martfy/views/widgets/custom_textield.dart';
import 'package:provider/provider.dart';

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
              CustomButton( 
                color: Colors.blue,
                onClick: () {
                  final name = _emailController.text;
                  final email = _passwordController.text;

                  final userVM = Provider.of<AuthVM>(context, listen: false);
                  final user = User(email: name, password: email);

                  userVM.login(user, (success) {
                    if (success) {
                      Navigator.pushNamed(context, HomeScreen.routeName);

                      Fluttertoast.showToast(
                        msg: 'Successfully Logged',
                        backgroundColor: Colors.green,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    } else {
                      // Handle the case when the login fails.
                      Fluttertoast.showToast(
                        msg: 'Login Failed',
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );
                    }
                  });
                },
                name: 'Login',
              )

              // GlobalVariables.mheight,
            ],
          ),
        ),
      ),
    );
  }
}
