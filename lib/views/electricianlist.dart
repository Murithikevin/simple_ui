import 'package:flutter/material.dart';
import 'package:simple_ui/views/settings.dart';
import 'package:simple_ui/views/viewworker.dart';

class Electricianpage extends StatelessWidget {
  const Electricianpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Top Electrician"),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.settings),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settingspage()),
                      );
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {
                      // Handle about tap
                      Navigator.pop(context);
                      // Add your about functionality here
                    },
                  ),
                ),
                // Add more PopupMenuItems for additional options
              ],
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                        hintText: 'Search result of electrician',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Adjust spacing between search bar and list
            Expanded(
              child: ListView(
                children: [
                  // Replace these containers with electrician profile items
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
                              builder: (context) => const ViewWorkerPage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
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
                              builder: (context) => const ViewWorkerPage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
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
                              builder: (context) => const ViewWorkerPage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
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
                              builder: (context) => const ViewWorkerPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 229, 204, 149),
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
                MaterialPageRoute(builder: (context) => const Settingspage()),
              );
            }
          },
        ));
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
                  color: Colors.black,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 48, 46, 46)),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 5),
                  Text(rating),
                ],
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('View'),
          ),
        ],
      ),
    );
  }
}
