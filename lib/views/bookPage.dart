import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Appointments'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAppointmentItem(
              name: 'John Doe',
              phoneNumber: '+123456789',
              email: 'john@example.com',
            ),
            _buildAppointmentItem(
              name: 'Jane Smith',
              phoneNumber: '+987654321',
              email: 'jane@example.com',
            ),
            _buildAppointmentItem(
              name: 'Alice Johnson',
              phoneNumber: '+1122334455',
              email: 'alice@example.com',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentItem({
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
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
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
