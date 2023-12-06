import 'package:flutter/material.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/auth/register.screen.dart';

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
class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialPage);
    _tabController.addListener(() {
      _pageController.animateToPage(
        _tabController.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(
                Icons.lock,
                size: 80,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: [
                  _buildTab('SIGN IN', Icons.login),
                  _buildTab('SIGN UP', Icons.person_add),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: PageView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 2,
                controller: _pageController,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return LoginScreen();
                  } else {
                    return RegistrationScreen();
                  }
                },
                onPageChanged: (index) {
                  _tabController.animateTo(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, IconData icon) {
    return Tab(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
