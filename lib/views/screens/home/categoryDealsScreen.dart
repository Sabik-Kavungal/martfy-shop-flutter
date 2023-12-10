import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_vm.dart';

class HomeScreenP extends StatefulWidget {
  static const routeName = 'cated-screen';

  final String category;
  const HomeScreenP({Key? key, required this.category}) : super(key: key);

  @override
  State<HomeScreenP> createState() => _HomeScreenPState();
}

class _HomeScreenPState extends State<HomeScreenP> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    Provider.of<HomeVM>(context, listen: false).getAllProducts(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Home"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Text(
              widget.category,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Consumer<HomeVM>(
            builder: (context, homeVM, child) {
              if (homeVM.isProduct) {
                // Show loading indicator or other UI
                return CircularProgressIndicator();
              } else {
                // Show your product list UI
                return SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: ListView.builder(
                    itemCount: homeVM.productList.length,
                    itemBuilder: (context, index) {
                      final product = homeVM.productList[index];
                      return ListTile(
                        title: Text(product.name ?? ''),
                        // Add other properties as needed
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),

    );
  }
}
