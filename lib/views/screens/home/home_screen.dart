import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/views/screens/admin/addProduct.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:martfy/views/screens/home/product_detail.dart';
import 'package:martfy/views/screens/home/topCategory.dart';
import 'package:martfy/views/widgets/custom_refresh.dart';
import 'package:martfy/views/widgets/custom_textield.dart';

import 'package:provider/provider.dart';

import '../auth/auth_screen.dart';

// HomeScreen.dart



class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Shop',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
           TopCategories(),
            SizedBox(height: 32),
            Text(
              'All Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<HomeVM>(
                builder: (context,s,child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.3,
                      mainAxisSpacing: 4.3,
                    ),
                    itemCount:s.productListAll.length, // Replace with your actual product count
                    itemBuilder: (context, index) {
                      final aaa =s.productListAll[index];
                      // Replace with your product card widget
                      return InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
                      },child: _buildProductCard(
                        name: aaa.name.toString(),
                        price: aaa.price ?? 0,
                        ontap: ()=> Navigator.pushNamed(
                context,
                ProductDetail.routeName,
                arguments: aaa,
              ),
                        
                      ));
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String categoryName, IconData icon, Color color) {
    return Container(
      width: 120,
       decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.8),
                border: Border.all(color: Colors.grey,width: 0.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                   
                  //  offset: Offset(0, 3),
                  ),
                ],
              ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 36,
          ),
          SizedBox(height: 8),
          Text(
            categoryName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({required String name,required double price,required dynamic Function() ontap}) {
    // Replace with your product card widget
    return InkWell(
      onTap: ontap,
      child: Container(
         decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.6),
                  border: Border.all(color: Colors.grey,width: 0.4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                     
                    //  offset: Offset(0, 3),
                    ),
                  ],
                ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              'Price: \$$price',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_cart, // Replace with your desired icon
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Product Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$50.00',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add to cart logic
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class HomeScreen extends StatelessWidget {
//   static const String routeName = '/home-screen';

//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Welcome Home"),
//       ),
//       drawer: _buildDrawer(context),
//       body:\
//     );
//   }

//   Widget _buildDrawer(BuildContext context) {
//     return Drawer(
//       child: Consumer<HomeVM>(
//         builder: (context, authVM, child) {
//           return Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [Colors.blue, Colors.indigo],
//               ),
//             ),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 DrawerHeader(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 40,
//                         backgroundColor: Colors.white,
//                         child: const Icon(
//                           Icons.person,
//                           color: Colors.blue,
//                           size: 40,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         authVM.user?.name ?? "Guest",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         authVM.user?.email ?? "guest@example.com",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.lock, color: Colors.white),
//                   title: Text(
//                     'Change Password',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.pushNamed(context, ChangePasswordPage.routeName);
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.person, color: Colors.white),
//                   title: Text(
//                     'Update Profile',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.pushNamed(context, UpdateProfilePage.routeName);
//                   },
//                 ),
//                 ListTile(
//                   leading:
//                       Icon(Icons.admin_panel_settings, color: Colors.white),
//                   title: Text(
//                     'Admin',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.pushNamed(context, AddProductScreen.routeName);
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.logout, color: Colors.white),
//                   title: Text(
//                     'Log Out',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     Provider.of<AuthVM>(context, listen: false).logoutUser();

//                     Navigator.pushNamed(context, AuthScreen.routeName);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

// }

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
