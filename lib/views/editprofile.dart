import 'package:flutter/material.dart';

class Editprofilepage extends StatelessWidget {
  const Editprofilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 204, 149),
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Handle home icon press
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 229, 204, 149),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/person.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {
                      // Handle camera icon press
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField('Name', 'John Doe'),
            _buildTextField('Email', 'johndoe@gmail.com'),
            _buildTextField('Phone', '+1234567890'),
            _buildTextField('Password', '123Maintreet', obscureText: true),
            _buildTextField('Field', 'Worker'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save changes button press
              },
              child: const Text('Save Changes'),
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

  Widget _buildTextField(String labelText, String defaultText,
      {bool obscureText = false}) {
    TextEditingController controller = TextEditingController(text: defaultText);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
