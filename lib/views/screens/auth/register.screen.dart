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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                  focusNode: FocusNode(),
                  value: vm.user.name ?? '',
                  hintText: 'username...',
                   onChange: (value) {
                  vm.user = vm.user.copyWith(name: value);
                },
                  prefixIcon: const Icon(Icons.person)),
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
                  vm.register((success) {
                    if (success) {
                      Navigator.pushNamed(context, LoginScreen.routeName)
                          .then((value) {
                        xmToast('Successfully registred', Colors.green);
                      });
                    } else {
                      xmToast('regitration Failed', Colors.red);
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
