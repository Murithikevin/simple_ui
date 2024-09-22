import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:simple_ui/views/login.dart';
import 'package:simple_ui/views/signup.dart';
import 'package:simple_ui/views/signup2.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to\n',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Quick Fix Handymen',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 224, 116, 152),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Spacer

            // Buttons inside containers
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Signuppageclient()),
                );
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 31, 32),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Sign up as client',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signuppageprovider()),
                );
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 31, 32),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Sign up as a service provider',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to the login page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 133, 100, 52),
    );
  }
}
