import 'package:flutter/material.dart';
import 'package:hi/screen/SHOP/shop.dart';
import 'dart:async';

import 'package:hi/screen/homepart1.dart';
import 'package:hi/screen/productDetails.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;
  late shop demo;

  // final List<Map<String, dynamic>> _wishlist = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Timer for automatic page transition
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      int nextPage = (_currentPage + 1) % 3; // Calculate next page index
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize demo using context.read in didChangeDependencies
    demo = context.read<shop>();
    final itemMenu = demo.products;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    demo = context.read<shop>();
    final itemMenu = demo.products;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Search Bar (Your existing code)
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white, // Background color for the search bar
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 209, 122, 122),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 6, // Blur radius
                      offset: const Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search any Product...',
                    hintStyle: const TextStyle(fontSize: 15),
                    suffixIcon: const Icon(Icons.keyboard_voice),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ),

            // Scrollable Content (Your existing code)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('All Featured',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.sort),
                                label: const Text('Sort'),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.filter_alt),
                                label: const Text('Filter'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryChip(
                                label: 'Beauty',
                                backgroundImage: 'assets/beauty.jpeg',
                                onTap: () {
                                  //Navigator.pushNamed(context, '/home');
                                }),
                            CategoryChip(
                                label: 'Fashion',
                                backgroundImage: 'assets/fashion.jpg',
                                onTap: () {
                                  // Handle fashion category
                                  print('Fashion clicked!');
                                }),
                            CategoryChip(
                                label: 'Kids',
                                backgroundImage: 'assets/kids.jpeg',
                                onTap: () {
                                  // Handle kids category
                                  print('Kids clicked!');
                                }),
                            CategoryChip(
                                label: 'Mens',
                                backgroundImage: 'assets/mens.jpeg',
                                onTap: () {
                                  // Handle mens category
                                  print('Mens clicked!');
                                }),
                            CategoryChip(
                                label: 'Womens',
                                backgroundImage: 'assets/womens.jpeg',
                                onTap: () {
                                  // Handle womens category
                                  print('Womens clicked!');
                                }),
                          ],
                        ),
                      ),
                      const Divider(height: 40, thickness: 1.0),
                      SizedBox(
                        height: 180,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage =
                                  page; // Update _currentPage on page change
                            });
                          },
                          children: [
                            _buildCarouselItem(
                              imagePath: 'assets/offer1.jpg',
                              discountText: '50-40% OFF',
                              description: 'Now in (product)\nAll colours',
                            ),
                            _buildCarouselItem(
                              imagePath: 'assets/offer2.jpg',
                              discountText: '25% OFF',
                              description: 'On selected items\nLimited time!',
                            ),
                            _buildCarouselItem(
                              imagePath: 'assets/offer3.jpg',
                              discountText: '70% OFF',
                              description: 'Clearance Sale\nHurry up!',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      // Dots Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            height: 8,
                            width: _currentPage == index ? 12 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.pink
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 16),
                      // Product List
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: itemMenu.length,
                        itemBuilder: (context, index) {
                          final product = itemMenu[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailsPage(product: product),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(9)),
                                      child: Image.asset(
                                        product['image'],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        //height: 50,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          product['price'],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(product['rating']
                                                    .toString()),
                                              ],
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                demo.isInWishlist(product)
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color:
                                                    demo.isInWishlist(product)
                                                        ? Colors.red
                                                        : Colors.grey,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (demo
                                                      .isInWishlist(product)) {
                                                    demo.removeFromWishlist(
                                                        product);
                                                  } else {
                                                    demo.addToWishlist(product);
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem({
    required String imagePath,
    required String discountText,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.2),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  discountText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Shop Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
