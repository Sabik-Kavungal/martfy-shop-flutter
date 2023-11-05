import 'package:flutter/material.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/auth/register.screen.dart';

import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static const route = 'auth-screen';
  int initialPage;

  AuthScreen({
    Key? key,
    this.initialPage = 0,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialPage == 1) {
        Provider.of<AuthVM>(context, listen: false)
            .updateSelectedIndex(widget.initialPage);
      } else if (widget.initialPage == 0) {
        Provider.of<AuthVM>(context, listen: false)
            .updateSelectedIndex(widget.initialPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController =
        PageController(initialPage: widget.initialPage);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Image(
                image: AssetImage('assets/login2.jpeg'),
                width: double.infinity,
                height: 150,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Consumer<AuthVM>(
              builder: (context, AuthVM, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _pageController.animateToPage(0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut),
                    child: Column(
                      children: [
                        Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontWeight: AuthVM.selectedIndex == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: AuthVM.selectedIndex == 0
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 60,
                          color: AuthVM.selectedIndex == 0
                              ? Colors.blue
                              : Colors.white,
                          margin: const EdgeInsets.only(top: 8),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  InkWell(
                    onTap: () => _pageController.animateToPage(1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut),
                    child: Column(
                      children: [
                        Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontWeight: AuthVM.selectedIndex == 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: AuthVM.selectedIndex == 1
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 60,
                          color: AuthVM.selectedIndex == 1
                              ? Colors.blue
                              : Colors.white,
                          margin: const EdgeInsets.only(top: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<AuthVM>(
                builder: (context, AuthVM, child) => PageView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 2,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    if (AuthVM.selectedIndex == 0) {
                      return LoginScreen();
                    } else {
                      return RegistrationScreen();
                    }
                  },
                  onPageChanged: (index) {
                    AuthVM.updateSelectedIndex(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
