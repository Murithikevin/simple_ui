import 'package:flutter/material.dart';
import 'package:simple_ui/views/bookPage.dart';
import 'package:simple_ui/views/dashboard.dart';
import 'package:simple_ui/views/login.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove app bar shadow
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(
          255, 229, 204, 149), // Background color for the settings page
      body: ListView(
        children: [
          _buildCategory(
            title: 'Account',
            items: [
              {'text': 'Profile', 'icon': Icons.person},
              {'text': 'Security', 'icon': Icons.security},
              {'text': 'Notifications', 'icon': Icons.notifications},
              {'text': 'Privacy', 'icon': Icons.lock},
            ],
          ),
          _buildCategory(
            title: 'Support & About',
            items: [
              {
                'text': 'Booked Appointments',
                'icon': Icons.help,
                'onTap': () {
                  // Navigate to BookPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BookPage()),
                  );
                },
              },
              {'text': 'Help & Support', 'icon': Icons.info},
              {'text': 'Terms and Policies', 'icon': Icons.contact_support},
            ],
          ),
          _buildCategory(
            title: 'Actions',
            items: [
              {'text': 'Report a problem', 'icon': Icons.report},
              {'text': 'Add Account', 'icon': Icons.account_box_sharp},
              {
                'text': 'Log Out',
                'icon': Icons.logout,
                'onTap': () {
                  // Navigate to BookPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategory({
    required String title,
    required List<Map<String, dynamic>> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Colors.grey[200], // Background color for the category
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1, // Just one item for the entire category
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey[200], // Background color for the category
                child: Column(
                  children: items.map((item) {
                    return Container(
                      color: Colors.white, // Background color for each item
                      child: ListTile(
                        leading: Icon(item['icon']),
                        title: Text(item['text']),
                        onTap:
                            item['onTap'], // Execute onTap function if provided
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
        const Divider(), // Add a divider between categories
      ],
    );
  }
}
