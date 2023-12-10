import 'package:flutter/material.dart';
import 'package:martfy/views/screens/home/product_detail.dart';
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
    Provider.of<HomeVM>(context, listen: false)
        .getAllProducts(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Home"),
      ),
      body: Column(
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
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(product.images![0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  product.name ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '\$${product.price ?? ''}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Handle item tap, e.g., navigate to product details screen
                              Navigator.pushNamed(
                                context,
                                ProductDetail.routeName,
                                arguments: product,
                              );
                            },
                          ),
                        );
                      },
                    ));
              }
            },
          ),
        ],
      ),
    );
  }
}
