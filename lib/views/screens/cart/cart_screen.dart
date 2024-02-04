import 'package:flutter/material.dart';

class ShoppingCartCard extends StatefulWidget {
  final String productName;
  final double price;
  final int quantity;
  final Function(int) onQuantityChanged;

  ShoppingCartCard({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  _ShoppingCartCardState createState() => _ShoppingCartCardState();
}

class _ShoppingCartCardState extends State<ShoppingCartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Price: \$${widget.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (widget.quantity > 1) {
                      widget.onQuantityChanged(widget.quantity - 1);
                    }
                  },
                ),
                Text(
                  widget.quantity.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    widget.onQuantityChanged(widget.quantity + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCartList extends StatefulWidget {
  @override
  _ShoppingCartListState createState() => _ShoppingCartListState();
}

class _ShoppingCartListState extends State<ShoppingCartList> {
  List<CartItem> cartItems = [
    CartItem('Product 1', 19.99, 2),
    CartItem('Product 2', 29.99, 1),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ShoppingCartCard(
            productName: cartItems[index].name,
            price: cartItems[index].price,
            quantity: cartItems[index].quantity,
            onQuantityChanged: (newQuantity) {
              // Update the quantity in the cart
              setState(() {
                cartItems[index].quantity = newQuantity;
              });
            },
          );
        },
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem(this.name, this.price, this.quantity);
}