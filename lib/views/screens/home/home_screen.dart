import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:martfy/views/widgets/custom_refresh.dart';
import 'package:martfy/views/widgets/custom_textield.dart';

import 'package:provider/provider.dart';

import '../auth/auth_screen.dart';

// HomeScreen.dart

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Home"),
      ),
      drawer: _buildDrawer(context),
      body: _buildHomeBody(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Consumer<HomeVM>(
        builder: (context, authVM, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.indigo],
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        authVM.user?.name ?? "Guest",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        authVM.user?.email ?? "guest@example.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.white),
                  title: Text(
                    'Change Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ChangePasswordPage.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text(
                    'Update Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, UpdateProfilePage.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<AuthVM>(context, listen: false).logoutUser();

                    Navigator.pushNamed(context, AuthScreen.routeName);

                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildHomeBody(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, authVM, child) {
        if (authVM.isLoading) {
          return const Center(
            child: SpinKitDoubleBounce(
              color: Colors.red,
              size: 78.0,
            ),
          );
        } else if (authVM.user == null) {
          return const Center(
            child: Text('No data available.'),
          );
        } else {
          return CustomRefresh(
            onRefresh: () async {
              await authVM.getProfile();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.blue.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // New UI elements for the home page
                        Text(
                          'Welcome to Your App!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // E-commerce UI elements
                        // Replace these with your specific e-commerce design
                        ElevatedButton(
                          onPressed: () {
                            // Add your e-commerce functionality here
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                          child: const Text(
                            'Shop Now',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Existing profile UI elements
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Hello, ${authVM.user?.name}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Email: ${authVM.user?.email}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ChangePasswordPage.routeName);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          child: const Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UpdateProfilePage.routeName);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: const Text(
                            'Update Profile',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<AuthVM>(context, listen: false)
                                .logoutUser();
                            Navigator.pushNamed(context, AuthScreen.routeName);

                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
// UpdateProfilePage.dart

// ChangePasswordPage.dart

class ChangePasswordPage extends StatelessWidget {
  static const String routeName = '/change-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: ChangePasswordForm(),
    );
  }
}

class ChangePasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeVM authVM = Provider.of<HomeVM>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: "current-password",
            focusNode: FocusNode(),
            value: authVM.currentPassword ?? '',
            onChange: (v) {
              authVM.currentPassword = v;
            },
          ),
          CustomTextField(
            hintText: "new-password",
            focusNode: FocusNode(),
            value: authVM.newPassword ?? '',
            onChange: (v) {
              authVM.newPassword = v;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              authVM.changePassword((success) {
                if (success) {
                  Navigator.pop(context);
                  xmToast('Successfully password changed', Colors.green);
                } else {
                  xmToast('Change password failed', Colors.red);
                }
              });
            },
            child: const Text("Change Password"),
          ),
        ],
      ),
    );
  }
}

class UpdateProfilePage extends StatelessWidget {
  static const String routeName = '/update-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: UpdateProfileForm(),
    );
  }
}

class UpdateProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeVM authVM = Provider.of<HomeVM>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CustomTextField(
            hintText: "Name",
            prefixIcon: Icon(Icons.person_search),
            value: authVM.user.name ?? '',
            onChange: (v) {
              authVM.user = authVM.user.copyWith(name: v);
            },
            focusNode: FocusNode(),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Email",
            prefixIcon: Icon(Icons.email),
            value: authVM.user.email ?? '',
            focusNode: FocusNode(),
            onChange: (v) {
              authVM.user = authVM.user.copyWith(email: v);
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              authVM.updateProfile((success) {
                if (success) {
                  Navigator.pop(context);
                  xmToast('Successfully profile changed', Colors.green);
                } else {
                  xmToast('Change profile failed', Colors.red);
                }
              });
            },
            child: const Text("Update Profile"),
          ),
        ],
      ),
    );
  }
}
