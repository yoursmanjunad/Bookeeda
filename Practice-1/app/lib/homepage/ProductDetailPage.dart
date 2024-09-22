import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final int productIndex;

  const ProductDetailPage({Key? key, required this.productIndex})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _selectedFormat = 'Paperback';
  final Map<String, double> _formatPrices = {
    'Paperback': 19.99,
    'Audio': 24.99,
    'E-book': 9.99,
  };

  @override
  Widget build(BuildContext context) {
    double price = _formatPrices[_selectedFormat]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product ${widget.productIndex + 1}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageCarousel(),
            _buildFormatSelector(),
            _buildPriceSection(price),
            _buildDescription(),
            _buildReviewSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildActionButtons(),
    );
  }

  Widget _buildImageCarousel() {
    return Stack(
      children: [
        Container(
          height: 250,
          child: PageView.builder(
            itemCount: 3, // Number of images for the product
            itemBuilder: (context, index) {
              return Image.asset(
                'images/Product ${widget.productIndex + 1}.jpg', // Ensure image paths are correct
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.red,
            onPressed: () {
              // Add to favorites functionality
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFormatSelector() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Format:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 10,
            children: _formatPrices.keys.map((format) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFormat = format;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _selectedFormat == format
                        ? Colors.orange
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.orange,
                    ),
                  ),
                  child: Text(
                    format,
                    style: TextStyle(
                      color: _selectedFormat == format
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection(double price) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        '\$${price.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'This is a detailed description of the product. It provides information about the content, quality, and other aspects of the book.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildReviewSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: index < 4
                    ? Colors.amber
                    : Colors.grey, // Example: 4 out of 5 stars
              );
            }),
          ),
          SizedBox(height: 8),
          Text('4.0 (120 reviews)', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddressPage()), // Navigate to address page
          );
        },
        child: Text('Add to Cart'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(vertical: 15),
          minimumSize: Size(double.infinity, 50), // Full width button
        ),
      ),
    );
  }
}

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Address')),
      body: Center(child: Text('Address Form Here')),
    );
  }
}
