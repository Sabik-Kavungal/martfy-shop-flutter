import 'package:flutter/material.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:provider/provider.dart';

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
        border: Border.all(color: Colors.grey, width: 0.4),
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
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.red,
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
                      fontSize: 14,
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
                  onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<HomeVM>(context, listen: false).getCarts();
              },
              icon: Icon(Icons.online_prediction))
        ],
      ),
      body: Consumer<HomeVM>(builder: (context, s, child) {
        return ListView.builder(
          itemCount: s.cartsList.length,
          itemBuilder: (context, index) {
            final as = s.cartsList[index];
            return ShoppingCartCard(
              productName: as.name ?? 'we',
              price: as.price ?? 0,
              quantity: int.parse(as.quantity.toString()),
              onQuantityChanged: (newQuantity) {},
            );
          },
        );
      }),
    );
  }
}
