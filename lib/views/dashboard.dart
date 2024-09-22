import 'package:flutter/material.dart';
import 'package:simple_ui/views/bookin.dart';
import 'package:simple_ui/views/electricianlist.dart';
import 'package:simple_ui/views/settings.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 229, 204, 149), // Set background color to cream
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: const Color.fromARGB(255, 72, 59, 133),
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Let\'s find',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'what you want',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search worker, field...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ), // Add spacing between container and categories
              const Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 72, 59, 133),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ), // Add spacing between categories and row of elements
              SizedBox(
                height: 100, // Adjust the height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryItem(imagePath: 'assets/all.png', text: 'All'),
                    CategoryItem(
                        imagePath: 'assets/electricity.png',
                        text: 'Electrician',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Electricianpage()),
                          );
                        }),
                    CategoryItem(imagePath: 'assets/tap.png', text: 'Plumber'),
                    CategoryItem(
                        imagePath: 'assets/mechanic.png', text: 'Mechanic'),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Add spacing between categories and profiles
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 184, 164, 125),
                ),
                // Set the color of the first container to black
                child: ProfileItem(
                  imagePath: 'assets/person.png',
                  name: 'John Doe',
                  title: 'Electrician',
                  rating: '4.8',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookinPage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 184, 164, 125),
                ), // Set the color of the second container to aqua
                child: ProfileItem(
                  imagePath: 'assets/person.png',
                  name: 'Jane Smith',
                  title: 'Electrician',
                  rating: '4.5',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookinPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.blue,
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
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
                    MaterialPageRoute(
                        builder: (context) => const Settingspage()),
                  );
                }
              },
            )));
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;

  const CategoryItem({super.key, required this.imagePath, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 5),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String title;
  final String rating;
  final VoidCallback onPressed;

  const ProfileItem({super.key, 
    required this.imagePath,
    required this.name,
    required this.title,
    required this.rating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 5),
                  Text(rating, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Appointment'),
          ),
        ],
      ),
    );
  }
}
