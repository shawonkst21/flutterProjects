import 'package:flutter/material.dart';
import 'package:hi/screen/SHOP/shop.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<shop>(context);
    final cartProduct = shopProvider.cart;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shipping Address Section
              Text('Shipping Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Home'),
                subtitle: Text('1901 Thornridge Cir. Shiloh, Hawaii 81063'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('CHANGE',
                      style: TextStyle(color: Color(0xFFF44336))),
                ),
              ),
              Divider(),

              // Shipping Type Section
              Text('Choose Shipping Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(Icons.local_shipping),
                title: Text('Economy'),
                subtitle: Text('Estimated Arrival 25 August 2023'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('CHANGE',
                      style: TextStyle(color: Color(0xFFF44336))),
                ),
              ),
              Divider(),

              // Order List Section (Dynamically Displaying Items from Cart)
              Text('Order List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling inside the column
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

              Divider(),

              // Continue to Payment Button
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF44336),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Navigate to the payment page
                },
                child: Text(
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
      margin: EdgeInsets.symmetric(vertical: 8),
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
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Size: $size'),
        trailing: Text('\$${price.toStringAsFixed(2)}'),
      ),
    );
  }
}
