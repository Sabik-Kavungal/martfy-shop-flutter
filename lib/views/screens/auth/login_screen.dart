import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/models/user_model.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/home/home_screen.dart';
import 'package:martfy/views/widgets/custom_button.dart';
import 'package:martfy/views/widgets/custom_textield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';
  LoginScreen({Key? key}) : super(key: key);
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVM>(context, listen: false);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                value: vm.user.email ?? '',
                hintText: 'email...',
                prefixIcon: const Icon(Icons.email),
                focusNode: _emailNode,
                onChange: (value) {
                  vm.user = vm.user.copyWith(email: value);
                },
              ),
              CustomTextField(
                value: vm.user.password ?? '',
                hintText: 'password...',
                prefixIcon: const Icon(Icons.lock),
                focusNode: _passwordNode,
                onChange: (value) {
                  vm.user = vm.user.copyWith(password: value);
                },
              ),
              CustomButton(
                color: Colors.blue,
                onClick: () {
                  vm.login((success) {
                    if (success) {
                      Navigator.pushNamed(context, HomeScreen.routeName)
                          .then((value) {
                        xmToast('Successfully Logged', Colors.green);
                      });
                    } else {
                      xmToast('Login Failed', Colors.red);
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
