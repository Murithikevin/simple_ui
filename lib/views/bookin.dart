import 'package:flutter/material.dart';
import 'package:simple_ui/views/settings.dart';

class BookinPage extends StatelessWidget {
  const BookinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an Appointment'),
        backgroundColor: const Color.fromARGB(
            255, 229, 204, 149), // Set app bar background color to blue
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
              // Handle settings icon press
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 229, 204, 149),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAppointmentItem(timeRange: '8:00 - 9:00'),
            _buildAppointmentItem(timeRange: '10:00 - 11:00'),
            _buildAppointmentItem(timeRange: '13:00 - 14:00'),
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
              MaterialPageRoute(builder: (context) =>  const Settingspage()),
            );
          }
        },
      ),);
  }

  Widget _buildAppointmentItem({
    required String timeRange,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 184, 164, 125), // Set container background color to red
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
              // Handle book button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Set button color to green
            ),
            child: const Text('Book', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 16),
          Text(
            timeRange,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
