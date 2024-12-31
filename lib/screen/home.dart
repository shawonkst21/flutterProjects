import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Timer for automatic page transition
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

            // Carousel Feature Added Here

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
                      // Dummy content for scrolling
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Product Item ${index + 1}'),
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

class CategoryChip extends StatelessWidget {
  final String label;
  final String backgroundImage;
  final VoidCallback onTap;

  const CategoryChip(
      {super.key,
      required this.label,
      required this.backgroundImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.7),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
