import 'package:flutter/material.dart';
import 'package:simple_ui/views/editprofile.dart';
import 'package:simple_ui/views/settings2.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 204, 149),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/person.png'),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Yazan Ahmad',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAppointmentItem(
              timeRange: '8:00 - 9:00',
              name: 'John Doe',
              phoneNumber: '+123456789',
              email: 'john@example.com',
            ),
            _buildAppointmentItem(
              timeRange: '10:00 - 11:00',
              name: 'Jane Smith',
              phoneNumber: '+987654321',
              email: 'jane@example.com',
            ),
            _buildAppointmentItem(
              timeRange: '13:00 - 14:00',
              name: 'Alice Johnson',
              phoneNumber: '+1122334455',
              email: 'alice@example.com',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            // Navigate to profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Editprofilepage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildAppointmentItem({
    required String timeRange,
    required String name,
    required String phoneNumber,
    required String email,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 78, 71, 71).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              // Handle cancel button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Set button color to green
            ),
            child: Text(timeRange, style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Phone: $phoneNumber'),
                const SizedBox(height: 4),
                Text('Email: $email'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
