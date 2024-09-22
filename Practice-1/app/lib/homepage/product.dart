// ProductDetailPage.dart

import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productTitle;
  final double productPrice;
  final String productImagePath;

  const ProductDetailPage({
    Key? key,
    required this.productTitle,
    required this.productPrice,
    required this.productImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build your product detail page using the passed parameters
    return Scaffold(
      appBar: AppBar(
        title: Text(productTitle),
      ),
      body: Column(
        children: [
          Image.asset(productImagePath),
          SizedBox(height: 16),
          Text(
            '\$${productPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Add other product details here
        ],
      ),
    );
  }
}
