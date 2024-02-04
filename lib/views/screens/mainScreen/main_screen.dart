import 'package:flutter/material.dart';
import 'package:martfy/views/screens/home/home_screen.dart';
import 'package:martfy/views/screens/home/topCategory.dart';
import 'package:martfy/views/screens/mainScreen/mainVM.dart';
import 'package:martfy/views/screens/profile/profile_scree.dart';
import 'package:provider/provider.dart';
class MainScreenxxx extends StatelessWidget {
  static const String routeName = '/main-screen';

  final List<Widget> pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
      UserProfileBody(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: pages[navProvider.currentIndex],
      bottomNavigationBar: Container(
        width: double.infinity, // Make the container extend the full width
        child: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          currentIndex: navProvider.currentIndex,
          onTap: (index) {
            navProvider.setIndex(index);
          },
          items: [
            BottomNavigationBarItem(
     
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Orders',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Orders',
            ),
            
          ],
        ),
      ),
    );
  }
}
