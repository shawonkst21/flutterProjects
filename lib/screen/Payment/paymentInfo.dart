import 'package:flutter/material.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 100, color: Colors.green),
              SizedBox(height: 20),
              Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Thank you for your purchase.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('View Order'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle e-receipt viewing
                },
                child: Text('View E-Receipt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
