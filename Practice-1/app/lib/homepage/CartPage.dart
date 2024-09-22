import 'package:flutter/material.dart';
import 'ProductDetailPage.dart';
import 'ThankYouPage.dart'; // Import your product detail page here

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double getTotalCost() {
    return widget.cartItems.fold(0.0, (total, item) => total + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.asset(item.localImagePath), // Local image
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        setState(() {
                          widget.cartItems.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      // Navigate to the product details page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            productTitle: item.title,
                            productImagePath:
                                item.localImagePath, // Pass local image path
                            productPrice: item.price,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${getTotalCost().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle checkout action
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ThankYouPage(),
                //   ),
                // );
              },
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Change to your preferred color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String title;
  final String localImagePath; // Use a local image path
  final double price;

  CartItem(
      {required this.title, required this.localImagePath, required this.price});
}

// Example ProductDetailPage for local images
class ProductDetailPage extends StatelessWidget {
  final String productTitle;
  final String productImagePath; // Local image path for the product
  final double productPrice;

  const ProductDetailPage({
    Key? key,
    required this.productTitle,
    required this.productImagePath,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(productImagePath), // Display the local image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${productPrice.toStringAsFixed(2)}'),
          ),
          // Add more product details or actions here
        ],
      ),
    );
  }
}
