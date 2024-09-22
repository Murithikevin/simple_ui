import 'package:flutter/material.dart';
import 'package:simple_ui/views/bookin.dart';
import 'package:simple_ui/views/settings.dart';

class ViewWorkerPage extends StatelessWidget {
  const ViewWorkerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Worker'),
        backgroundColor: const Color.fromARGB(
            255, 229, 204, 149), // Set app bar background color to blue
      ),
      backgroundColor: const Color.fromARGB(
          255, 229, 204, 149), // Set app background color to blue
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(
                255, 184, 164, 125), // Set container background color to red
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 184, 164, 125),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/person.png'),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'John Doe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            'Plumber',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text(
                                '4.5', // Rating value
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BookinPage()),
                              );
                            },
                            child: const Text('Appointment'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Price Range per Hour',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const PriceRangeIndicator(
                lowPrice: 35, // Low price
                highPrice: 75, // High price
              ),
              const SizedBox(height: 20),
              const Text(
                'Rating',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star_half, color: Colors.yellow),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Photos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200, // Adjust height as needed
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 4, // Number of images
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      'assets/image.jpeg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ],
          ),
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
              MaterialPageRoute(builder: (context) => const Settingspage()),
            );
          }
        },
      ),
    );
  }
}

class PriceRangeIndicator extends StatelessWidget {
  final int lowPrice;
  final int highPrice;

  const PriceRangeIndicator({
    Key? key,
    required this.lowPrice,
    required this.highPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: double.infinity, //  width to fill available space
      child: Stack(
        children: [
          Container(
            height: 10, // Height of the range indicator
            width: double.infinity, // Width of the range indicator
            color: const Color.fromARGB(255, 218, 191, 39),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: _PriceMark(lowPrice.toString()),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: _PriceMark(highPrice.toString()),
          ),
        ],
      ),
    );
  }
}

class _PriceMark extends StatelessWidget {
  final String price;

  const _PriceMark(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        '\$$price',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
