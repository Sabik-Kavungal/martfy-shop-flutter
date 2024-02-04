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
        title: Text(
          widget.category,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<HomeVM>(
            builder: (context, homeVM, child) {
              if (homeVM.isProduct) {
                // Show loading indicator or other UI
                return CircularProgressIndicator();
              } else {
                // Show your product list UI
                return Expanded(
                    child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio:
                        0.7, // Adjust this value for the desired aspect ratio
                  ),
                  itemCount: homeVM.productList.length,
                  itemBuilder: (context, index) {
                    final product = homeVM.productList[index];
                    return _buildProductCard(
                      name: product.name ?? '',
                      price: product.price ?? 0,
                      ontap: () => Navigator.pushNamed(
                        context,
                        ProductDetail.routeName,
                        arguments: product,
                      ),
                    );

                    // Container(
                    //  decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(3.6),
                    //         border: Border.all(color: Colors.grey,width: 0.4),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.grey.withOpacity(0.5),

                    //           //  offset: Offset(0, 3),
                    //           ),
                    //         ],
                    //       ),
                    //   child: ListTile(
                    //     contentPadding: const EdgeInsets.all(8),
                    //     title: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         product.images != null && product.images!.isNotEmpty
                    //             ? Container(
                    //                 height: 130,
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(
                    //                     color: Colors.black12,
                    //                     width: 0.5,
                    //                   ),
                    //                   borderRadius: BorderRadius.circular(8),
                    //                   image: DecorationImage(
                    //                     image: NetworkImage(product.images![0]),
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ),
                    //               )
                    //             : SizedBox.shrink(),
                    //         SizedBox(height: 8),
                    //         Text(
                    //           product.name ?? '',
                    //           maxLines: 2,
                    //           overflow: TextOverflow.ellipsis,
                    //           style: TextStyle(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         SizedBox(height: 4),
                    //         Text(
                    //           '\$${product.price ?? ''}',
                    //           style: TextStyle(
                    //             fontSize: 14,
                    //             color: Colors.red,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     onTap: () {
                    //       // Handle item tap, e.g., navigate to product details screen
                    //       Navigator.pushNamed(
                    //         context,
                    //         ProductDetail.routeName,
                    //         arguments: product,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                ));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      {required String name,
      required double price,
      required dynamic Function() ontap}) {
    // Replace with your product card widget
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.6),
          border: Border.all(color: Colors.grey, width: 0.4),
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
              color: Colors.red,
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
              'Price: \$$name',
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
