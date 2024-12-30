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
                onTap: () {
                  // Add logout functionality here
                },
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
}
