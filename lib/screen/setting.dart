import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFFF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dark Mode Toggle
            Container(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(16),
              child: SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                activeColor: Colors.blue,
              ),
            ),

            // Settings List
            Container(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildSettingsOption('Order History', Icons.history, () {
                    /* Navigate */
                  }),
                  _buildSettingsOption('Shipping Details', Icons.local_shipping,
                      () {/* Navigate */}),
                  _buildSettingsOption('All Coupons', Icons.local_offer, () {
                    /* Navigate */
                  }),
                  _buildSettingsOption('Payment Settings', Icons.payment, () {
                    /* Navigate */
                  }),
                  _buildSettingsOption('E-Commerce Settings', Icons.settings,
                      () {/* Navigate */}),
                  _buildSettingsOption('Language', Icons.language, () {
                    /* Navigate */
                  }),
                  _buildSettingsOption('Help', Icons.help, () {/* Navigate */}),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Logout Button
            Container(
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: _showLogoutDialog, // Call the dialog
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.grey[600]),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: isDarkMode ? Colors.white : Colors.grey,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.logout, size: 48, color: Colors.red),
                const SizedBox(height: 8),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home'); // Close the dialog
                    // Add logout functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Yes, logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(context), // Close the dialog
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
