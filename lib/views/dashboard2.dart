import 'package:flutter/material.dart';
import 'package:simple_ui/views/editprofile.dart';
import 'package:simple_ui/views/settings2.dart';
import 'package:simple_ui/views/viewappointment.dart';

class Dashboardprovider extends StatelessWidget {
  const Dashboardprovider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 229, 204, 149),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Editprofilepage(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/person.png'),
                )),
            const SizedBox(height: 20),
            const Text(
              'Yazan Ahmad',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 4),
                Text(
                  'Amman, JO',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Construction Worker',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildItemWithNumber('like', 122),
                const SizedBox(width: 26),
                _buildItemWithNumber('Jobs', 67),
                const SizedBox(width: 26),
                _buildItemWithNumber('Dislike', 37),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppointmentPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 8, 12, 73),
                  ),
                  child: const Text('View Appointments',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle available button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 8, 12, 73),
                  ),
                  child:
                      const Text('Available', style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Photos'),
                SizedBox(width: 20),
                Text('Likes'),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  'assets/image$index.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
            const SizedBox(height: 20),
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

  Widget _buildItemWithNumber(String text, int number) {
    return Column(
      children: [
        Text(
          '$number',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
