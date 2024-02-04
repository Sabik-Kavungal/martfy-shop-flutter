import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/commen_variable.dart';
import '../../../models/product_model.dart';

import 'package:flutter/material.dart';

import 'home_vm.dart';

class ProductDetail extends StatelessWidget {
   static const String routeName = '/product-details';
  final Product product;

  const ProductDetail({super.key, required this.product});
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
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              product.name ??'',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6),
            Text(
             product.description ?? '',
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
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                ElevatedButton(
              onPressed: () {
                Provider.of<HomeVM>(context, listen: false).addToCart(
                    (success) {
                  if (success) {
                    Navigator.pop(context);
                    xmToast('Successfully added to cart', Colors.green);
                  } else {
                    xmToast('Change add to cart', Colors.red);
                  }
                }, product);
              },
              child: Text('Add to Cart'),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
