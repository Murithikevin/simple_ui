import 'package:flutter/material.dart';

class AboutMepage extends StatefulWidget {
  const AboutMepage({Key? key}) : super(key: key);

  @override
  _AboutMepageState createState() => _AboutMepageState();
}

class _AboutMepageState extends State<AboutMepage> {
  final TextEditingController _constructionWorkerController =
      TextEditingController(text: 'Construction Worker');
  final TextEditingController _hourlyRateController =
      TextEditingController(text: '\$999.00/hr');
  final TextEditingController _loremIpsumController = TextEditingController(
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');
  bool _isEditing = false;

  @override
  void dispose() {
    _constructionWorkerController.dispose();
    _hourlyRateController.dispose();
    _loremIpsumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 204, 149),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              // Handle settings icon press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            _buildRow('Construction Worker', Icons.edit,
                _constructionWorkerController),
            _buildRow('\$999.00/hr', Icons.edit, _hourlyRateController),
            _buildRow(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              Icons.edit,
              _loremIpsumController,
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Work History'),
            // Add your work history widgets here
            const SizedBox(height: 8),
            const Text(
              'No items',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Portfolio', icon: Icons.add),
            _buildPortfolioSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
      String text, IconData icon, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: _isEditing
                ? TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Construction Worker',
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
          ),
          if (!_isEditing)
            IconButton(
              icon: Icon(icon),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                setState(() {
                  _isEditing = false;
                  // Save the edited value
                });
              },
            ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (icon != null)
            IconButton(
              icon: Icon(icon),
              onPressed: () {
                // Handle add button press
              },
            ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Implement file browsing functionality
          },
          child: const Column(
            children: [
              Icon(Icons.cloud_upload, size: 80),
              SizedBox(height: 8),
              Text(
                'Showcase your work to win more projects',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Add items to impress clients',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
