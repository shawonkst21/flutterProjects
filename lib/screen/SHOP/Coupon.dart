import 'package:flutter/material.dart';

class CouponPage extends StatelessWidget {
  final List<Map<String, String>> coupons = [
    {
      'code': 'WELCOME200',
      'condition': 'Add items worth \$2 more to unlock',
      'offer': 'Get 50% OFF',
    },
    {
      'code': 'CASHBACK12',
      'condition': 'Add items worth \$2 more to unlock',
      'offer': 'Up to \$12.00 cashback',
    },
    {
      'code': 'FEST2COST',
      'condition': 'Add items worth \$28 more to unlock',
      'offer': 'Get 50% OFF for Combo',
    },
    {
      'code': 'WELCOME200',
      'condition': 'Add items worth \$2 more to unlock',
      'offer': 'Get 50% OFF',
    },
  ];

  CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Coupon',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Best offers for you',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Column(
                children: coupons
                    .map(
                      (coupon) => CouponCard(
                        code: coupon['code']!,
                        condition: coupon['condition']!,
                        offer: coupon['offer']!,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final String code;
  final String condition;
  final String offer;

  const CouponCard({super.key, 
    required this.code,
    required this.condition,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8.0,
            spreadRadius: 2.0,
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            condition,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                offer,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.brown.shade700,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add copy code functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'COPY CODE',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
