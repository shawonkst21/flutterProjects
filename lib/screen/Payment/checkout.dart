import 'package:flutter/material.dart';
import 'package:hi/screen/Payment/paymentMethod.dart';
import 'package:hi/screen/SHOP/shop.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<shop>(context);
    final cartProduct = shopProvider.cart;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shipping Address Section
              const Text('Shipping Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Home'),
                subtitle: const Text('1901 Thornridge Cir. Shiloh, Hawaii 81063'),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('CHANGE',
                      style: TextStyle(color: Color(0xFFF44336))),
                ),
              ),
              const Divider(),

              // Shipping Type Section
              const Text('Choose Shipping Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: const Icon(Icons.local_shipping),
                title: const Text('Economy'),
                subtitle: const Text('Estimated Arrival 25 August 2023'),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('CHANGE',
                      style: TextStyle(color: Color(0xFFF44336))),
                ),
              ),
              const Divider(),

              // Order List Section (Dynamically Displaying Items from Cart)
              const Text('Order List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling inside the column
                itemCount: cartProduct.length,
                itemBuilder: (context, index) {
                  final item = cartProduct[index];
                  return _buildOrderItem(
                    item['image'],
                    item['name'],
                    item['size'],
                    double.parse(item['price'].replaceAll('\$', '')) *
                        item['quantity'],
                  );
                },
              ),

              const Divider(),

              // Continue to Payment Button
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF44336),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Navigate to the payment page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentMethodsPage()),
                  );
                },
                child: const Text(
                  'Continue to Payment',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Order Item Widget
  Widget _buildOrderItem(
      String imagePath, String name, String size, double price) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Size: $size'),
        trailing: Text('\$${price.toStringAsFixed(2)}'),
      ),
    );
  }
}
