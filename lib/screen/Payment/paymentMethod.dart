import 'package:flutter/material.dart';
import 'package:Trendify/screen/Payment/card.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  // Selected payment option
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Payment Methods',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Credit & Debit Cards Section
            const Text(
              'Credit & Debit Card',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPaymentOption(
              icon: Icons.credit_card,
              title: 'Add Card',
              value: 'credit_card',
              onTap: () {
                setState(() => _selectedPaymentMethod = 'credit_card');
              },
            ),

            const SizedBox(height: 30),

            // More Payment Options Section
            const Text(
              'More Payment Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPaymentOption(
              icon: Icons.paypal,
              title: 'PayPal',
              value: 'paypal',
              onTap: () {
                setState(() => _selectedPaymentMethod = 'paypal');
              },
            ),
            const SizedBox(height: 10),
            _buildPaymentOption(
              icon: Icons.apple,
              title: 'Apple Pay',
              value: 'apple_pay',
              onTap: () {
                setState(() => _selectedPaymentMethod = 'apple_pay');
              },
            ),
            const SizedBox(height: 10),
            _buildPaymentOption(
              icon: Icons.g_mobiledata,
              title: 'Google Pay',
              value: 'google_pay',
              onTap: () {
                setState(() => _selectedPaymentMethod = 'google_pay');
              },
            ),
            const SizedBox(height: 10),
            _buildPaymentOption(
              icon: Icons.account_balance_wallet,
              title: 'Net Banking',
              value: 'net_banking',
              onTap: () {
                setState(() => _selectedPaymentMethod = 'net_banking');
              },
            ),

            const Spacer(),

            // Confirm Payment Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade900,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _selectedPaymentMethod == null
                  ? null
                  : () {
                      // Define navigation based on selected payment method
                      Widget targetPage;
                      switch (_selectedPaymentMethod) {
                        case 'credit_card':
                          targetPage =
                              const AddCardPage(); // Navigate to Add Card Page
                          break;
                        case 'paypal':
                          targetPage =
                              const PayPalPage(); // Replace with PayPalPage
                          break;
                        case 'apple_pay':
                          targetPage =
                              const ApplePayPage(); // Replace with ApplePayPage
                          break;
                        case 'google_pay':
                          targetPage =
                              const GooglePayPage(); // Replace with GooglePayPage
                          break;
                        case 'net_banking':
                          targetPage =
                              const NetBankingPage(); // Replace with NetBankingPage
                          break;
                        default:
                          targetPage =
                              Container(); // Fallback (shouldn't occur)
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => targetPage),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Navigating to: $_selectedPaymentMethod'),
                      ));
                    },
              child: const Text(
                'Confirm Payment Method',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _selectedPaymentMethod == value
              ? Colors.grey.shade100
              : Colors.white,
          border: Border.all(
            color: _selectedPaymentMethod == value
                ? Colors.blueGrey.shade900
                : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            if (_selectedPaymentMethod == value)
              const Icon(Icons.check_circle, color: Color(0xE0F24865)),
          ],
        ),
      ),
    );
  }
}

class NetBankingPage extends StatelessWidget {
  const NetBankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class GooglePayPage extends StatelessWidget {
  const GooglePayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class PayPalPage extends StatelessWidget {
  const PayPalPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ApplePayPage extends StatelessWidget {
  const ApplePayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
