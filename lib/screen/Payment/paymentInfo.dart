import 'package:Trendify/screen/Payment/order.dart';
import 'package:flutter/material.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated checkmark icon
                  const Icon(
                    Icons.check_circle,
                    size: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 30),
                  // Stylish "Payment Successful" text
                  const Text(
                    'Payment Successful!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Thank you for your purchase. Your payment has been processed successfully.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Elevated button with rounded corners
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4CAF50),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'View Order',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // TextButton with custom styling
                  TextButton(
                    onPressed: () {
                      // Handle e-receipt viewing
                    },
                    child: const Text(
                      'View E-Receipt',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  //  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/homePage');
                    },
                    child: const Text(
                      'Back-To-Home',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
