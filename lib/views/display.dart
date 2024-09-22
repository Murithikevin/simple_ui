import 'package:flutter/material.dart';
import 'package:simple_ui/views/homepage.dart';

class Displaypage extends StatefulWidget {
  const Displaypage({Key? key}) : super(key: key);

  @override
  State<Displaypage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Displaypage> {
  @override
  void initState() {
    super.initState();
    _navigatetowelcome();
  }

  _navigatetowelcome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/oil.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 200.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'NISHATI',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Where convenience meets innovation',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
