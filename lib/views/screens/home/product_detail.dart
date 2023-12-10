import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/commen_variable.dart';
import '../../../models/product_model.dart';

import 'package:flutter/material.dart';

import 'home_vm.dart';

class ProductDetail extends StatelessWidget {
  static const String routeName = '/product-details';
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
      product.images != null && product.images!.isNotEmpty ?  Image.network(
            product.images![0] ?? '', // Use the product image URL
            height: 200,
            fit: BoxFit.cover,
          ) : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              product.name ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(product.id ?? '', style: TextStyle(color: Colors.blue)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: RichText(
              text: TextSpan(
                text: 'Deal Price: ',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '\$${product.price ?? ''}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.description ?? ''),
          ),
          Container(
            color: Colors.black12,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
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
          ),
        ],
      ),
    );
  }
}
