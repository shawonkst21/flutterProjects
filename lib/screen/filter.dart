import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedBrand = 'All';
  String selectedGender = 'All';
  String selectedSortBy = 'Popular';
  RangeValues selectedPriceRange = const RangeValues(2, 100);
  String selectedReview = '4.5 and above';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Filter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Brands'),
            _buildFilterChips(
              ['All', 'Nike', 'Adidas', 'Puma', 'Fila'],
              selectedBrand,
              (value) {
                setState(() {
                  selectedBrand = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Gender'),
            _buildFilterChips(
              ['All', 'Men', 'Women'],
              selectedGender,
              (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Sort by'),
            _buildFilterChips(
              ['Most Recent', 'Popular', 'Price High'],
              selectedSortBy,
              (value) {
                setState(() {
                  selectedSortBy = value;
                });
              },
            ),
            const SizedBox(height: 16),
            StylishRangeSlider(
              initialRange: selectedPriceRange,
              onChanged: (RangeValues values) {
                setState(() {
                  selectedPriceRange = values;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Reviews'),
            _buildReviewOptions(
              [
                '4.5 and above',
                '4.0 - 4.5',
                '3.5 - 4.0',
                '3.0 - 3.5',
                '2.5 - 3.0'
              ],
              selectedReview,
              (value) {
                setState(() {
                  selectedReview = value;
                });
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  // Reset functionality
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.brown),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Reset Filter',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Apply functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method: Build Filter Chips
  Widget _buildFilterChips(
      List<String> items, String selectedItem, Function(String) onSelected) {
    return Wrap(
      spacing: 8,
      children: items.map((item) {
        final isSelected = item == selectedItem;
        return ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.brown,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.grey[200],
          selectedColor: Colors.brown,
          elevation: isSelected ? 4 : 0,
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              onSelected(item);
            }
          },
        );
      }).toList(),
    );
  }

  // Helper Method: Build Review Options
  Widget _buildReviewOptions(List<String> reviews, String selectedReview,
      Function(String) onSelected) {
    return Column(
      children: reviews.map((review) {
        final isSelected = review == selectedReview;
        return Card(
          elevation: isSelected ? 4 : 1,
          shadowColor: isSelected ? Colors.brown : Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: RadioListTile<String>(
            value: review,
            groupValue: selectedReview,
            activeColor: Colors.brown,
            title: Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  review,
                  style: TextStyle(
                    color: isSelected ? Colors.brown : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            onChanged: (value) {
              onSelected(value!);
            },
          ),
        );
      }).toList(),
    );
  }

  // Helper Method: Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Custom Stylish Range Slider Widget
class StylishRangeSlider extends StatelessWidget {
  final RangeValues initialRange;
  final ValueChanged<RangeValues> onChanged;

  const StylishRangeSlider({
    super.key,
    required this.initialRange,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pricing Range',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPriceLabel('\$${initialRange.start.toInt()}'),
                  const SizedBox(width: 100),
                  _buildPriceLabel('\$${initialRange.end.toInt()}'),
                ],
              ),
            ),
            RangeSlider(
              values: initialRange,
              min: 2,
              max: 150,
              divisions: 15,
              labels: RangeLabels(
                '\$${initialRange.start.toInt()}',
                '\$${initialRange.end.toInt()}',
              ),
              activeColor: Colors.brown,
              inactiveColor: Colors.grey[300],
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.brown.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}