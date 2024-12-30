import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Search Bar
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
            // Scrollable Content
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
                      const SizedBox(height: 16),
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
