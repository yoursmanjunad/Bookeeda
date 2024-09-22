import 'package:flutter/material.dart';
import 'CartPage.dart';
import 'ProductDetailPage.dart'; // Ensure this import points to the correct file

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // State variable to track current tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildSliverList(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// Builds the enhanced SliverAppBar with a Netflix-like top banner.
  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      floating: false,
      pinned: true,
      title: Text("Marketky"), // App name in the AppBar
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Handle notification press
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(
              top: 80), // Adding padding from the top of the AppBar
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'images/Product 2.jpg', // Ensure the image path is correct
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: MediaQuery.of(context).size.width * 0.25,
                right: MediaQuery.of(context).size.width * 0.25,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Netflix-like red button
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Handle 'Read Now' button press
                  },
                  child: Text(
                    'Read Now!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the SliverList containing product categories.
  SliverList _buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate([
        ProductCategory(title: 'Featured Products'),
        ProductCategory(title: 'New Arrivals'),
        ProductCategory(title: 'Best Sellers'),
      ]),
    );
  }

  /// Builds the BottomNavigationBar for navigation.
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex, // Bind currentIndex to state
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Update current index on tap
        });
      },
    );
  }
}

class ProductCategory extends StatelessWidget {
  final String title;

  const ProductCategory({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoryTitle(context),
        _buildProductList(context), // Pass context to the product list
      ],
    );
  }

  /// Builds the title of the product category.
  Padding _buildCategoryTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryPage(title: title)),
          );
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// Builds a horizontal list of products.
  Container _buildProductList(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildProductCard(
              context, index); // Pass context to the product card
        },
      ),
    );
  }

  /// Builds a card for each product.
  Card _buildProductCard(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          // Navigate to the product detail page with only product title and price
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                productTitle: 'Product ${index + 1}',
                productPrice: 100,
                productImagePath: 'images/Product 1.jpg',
              ),
            ),
          );
        },
        child: Container(
          width: 150,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  'images/Product ${index + 1}.jpg', // Ensure image path is correct
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Product ${index + 1}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String title;

  const CategoryPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('More products in $title category')),
    );
  }
}
