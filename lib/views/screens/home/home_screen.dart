import 'package:flutter/material.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:martfy/views/widgets/custom_refresh.dart';
import 'package:martfy/views/widgets/custom_textield.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Home"),
      ),
      body: Consumer<HomeVM>(
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .blue, // Background color for the avatar
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white, // Color of the person icon
                              size: 50,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Hello, ${authVM.user?.name}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Email: ${authVM.user?.email}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _showChangePasswordDialog(context,authVM);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
                            child: const Text(
                              "Change Password",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              _showUpdateProfileDialog(context,authVM);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            child: const Text(
                              "Update Profile",
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
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                            child: const Text(
                              "Log Out",
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
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context, HomeVM authVM) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Change Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
                      xmToast('change password Failed', Colors.red);
                    }
                  });
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text("Change Password"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showUpdateProfileDialog(BuildContext context, HomeVM authVM) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement the logic to update the profile
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text("Update Profile"),
              ),
            ],
          ),
        );
      },
    );
  }
}
