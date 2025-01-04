import 'package:flutter/material.dart';
import 'package:hi/screen/SHOP/shop.dart';
import 'package:provider/provider.dart';
//import 'shop.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<shop>(context);
    final cartItems = shopProvider.cart;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Product Image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item['image'],
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10), // Spacing between image and text

                        // Product Details Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Size: ${item['size']}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "\$${(double.parse(item['price'].replaceAll('\$', '')) * item['quantity']).toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 69, 14, 157),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: item['color'],
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    " ${_getColorName(item['color'])}",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        // Quantity Controls Section
                        Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Remove Quantity Button
                                IconButton(
                                  icon: Icon(Icons.remove, color: Colors.brown),
                                  onPressed: () {
                                    shopProvider.decreaseQuantity(item);
                                  },
                                ),
                                // Quantity Display
                                Text(
                                  '${item['quantity']}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                // Add Quantity Button
                                IconButton(
                                  icon: Icon(Icons.add, color: Colors.brown),
                                  onPressed: () {
                                    shopProvider.increaseQuantity(item);
                                  },
                                ),
                              ],
                            ),
                            // Delete Button (Align Right)
                            TextButton(
                              //  icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                shopProvider.removeFromCart(item);
                              },
                              child: const Text(
                                'remove',
                                style: TextStyle(color: Color(0xFFF44336)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _buildCartSummary(context, shopProvider),
        ],
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, shop shopProvider) {
    double subtotal = shopProvider.cart.fold(0, (sum, item) {
      return sum +
          (double.parse(item['price'].replaceAll('\$', '')) * item['quantity']);
    });
    double deliveryFee = 25.0;
    double discount = -35.0;
    double total = subtotal + deliveryFee + discount;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 238, 238),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Promo Code',
                    labelStyle:
                        TextStyle(color: Colors.grey[500], fontSize: 15),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.brown, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Color(0xFFF44336)),
                  )),
            ],
          ),
          SizedBox(height: 10),
          _buildSummaryRow('Sub-Total', '\$${subtotal.toStringAsFixed(2)}'),
          _buildSummaryRow(
              'Delivery Fee', '\$${deliveryFee.toStringAsFixed(2)}'),
          _buildSummaryRow('Discount', '\$${discount.toStringAsFixed(2)}'),
          Divider(),
          _buildSummaryRow('Total Cost', '\$${total.toStringAsFixed(2)}',
              isBold: true),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF44336),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {},
            child: Center(
                child: Text('Proceed to Checkout',
                    style:
                        TextStyle(color: Color.fromARGB(255, 249, 247, 247)))),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  String _getColorName(Color color) {
    if (color == Colors.red) {
      return 'Red';
    } else if (color == Colors.blue) {
      return 'Blue';
    } else if (color == Colors.green) {
      return 'Green';
    } else if (color == Colors.brown) {
      return 'Brown';
    } else if (color == Colors.black) {
      return 'Black';
    } else if (color == Colors.white) {
      return 'White';
    } else {
      return 'Custom Color';
    }
  }
}
