import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Search Bar
            Container(
              padding: const EdgeInsets.all(16.0),
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
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search any Product...',
                    hintStyle: TextStyle(fontSize: 15),
                    suffixIcon: Icon(Icons.keyboard_voice),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('All Featured',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.sort),
                                label: Text('Sort'),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.filter_alt),
                                label: Text('Filter'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryChip(label: 'Beauty'),
                            CategoryChip(label: 'Fashion'),
                            CategoryChip(label: 'Kids'),
                            CategoryChip(label: 'Mens'),
                            CategoryChip(label: 'Womens'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      // Dummy content for scrolling
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
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

  CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
