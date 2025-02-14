import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image and Edit Icon
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/profile.jpg'), // Replace with your image path
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      //  Positioned(child: Text("Sadman Shawon"))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sadman Shawon",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // Personal Details Section
            const Text(
              'Personal Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTextField(
                label: 'Email Address',
                hintText: 'sadmanshawonkst11@gmail.com'),
            const SizedBox(height: 10),
            _buildTextField(
                label: 'Password',
                hintText: '********',
                suffixWidget: TextButton(
                    onPressed: () {}, child: const Text('Change Password'))),

            const Divider(height: 40, thickness: 1.0),

            // Business Address Details Section
            const Text(
              'Business Address Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTextField(label: 'Pincode', hintText: '70000'),
            const SizedBox(height: 10),
            _buildTextField(
                label: 'Address', hintText: 'sonali Abashik,sylhet'),
            const SizedBox(height: 10),
            _buildTextField(label: 'City', hintText: 'Sylhet'),
            const SizedBox(height: 10),
            _buildTextField(label: 'State', hintText: 'None'),
            const SizedBox(height: 10),
            _buildTextField(label: 'Country', hintText: 'Bangladesh'),

            const Divider(height: 40, thickness: 1.0),

            // Bank Account Details Section
            const Text(
              'Bank Account Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTextField(
                label: 'Bank Account Number', hintText: '1234XXXXXXXXXX'),
            const SizedBox(height: 10),
            _buildTextField(label: 'Account Holder', hintText: 'Sadman shawon'),
            const SizedBox(height: 10),
            _buildTextField(label: 'IFSC Code', hintText: 'IFSCXXXXXX'),

            const SizedBox(height: 30),
            // Save Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: const Color.fromARGB(248, 66, 240, 100),
                  elevation: 5,
                ),
                onPressed: () {
                  // Handle save action here
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    Widget? suffixWidget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixWidget,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
