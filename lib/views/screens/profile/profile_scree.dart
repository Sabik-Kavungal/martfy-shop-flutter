import 'package:flutter/material.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/auth_screen.dart';
import 'package:martfy/views/screens/home/home_screen.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:martfy/views/screens/home/topCategory.dart';
import 'package:provider/provider.dart';

class UserProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Consumer<HomeVM>(
        builder: (context, authVM, child) {
          if (authVM.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (authVM.user == null) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
             
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.person,
                      color: Colors.red,
                      size: 80,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${authVM.user?.name}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${authVM.user?.email}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
      
                  // Amazon-like Account Page Section
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildListTile(Icons.shopping_cart, 'Orders', () {
                          // Handle Orders tap
                        }),
                        _buildDivider(),
                        _buildListTile(Icons.credit_card, 'Payment Methods', () {
                          // Handle Payment Methods tap
                        }),
                        _buildDivider(),
                        _buildListTile(Icons.location_on, 'Addresses', () {
                          // Handle Addresses tap
                        }),
                        _buildDivider(),
                        _buildListTile(Icons.notifications, 'Notifications', () {
                          // Handle Notifications tap
                        }),
                        _buildDivider(),
                        _buildListTile(Icons.lock, 'Update Password', () {
                          // Handle Update Password tap
                          Navigator.pushNamed(
                              context, ChangePasswordPage.routeName);
                        }),
                        _buildDivider(),
                        _buildListTile(Icons.edit, 'Update Profile', () {
                          // Handle Update Profile tap
                          Navigator.pushNamed(
                              context, UpdateProfilePage.routeName);
                        }),
                        _buildDivider(),
                        _buildListTile(Icons.logout, 'Log out', () {
                          Provider.of<AuthVM>(context, listen: false)
                              .logoutUser();
                          Navigator.pushNamed(context, AuthScreen.routeName);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey,
      height: 0.5,
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}
