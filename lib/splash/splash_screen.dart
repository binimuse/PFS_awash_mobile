import 'package:awashfeedback/constants.dart';
import 'package:awashfeedback/home/home.dart';
import 'package:flutter/material.dart';

//import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuth = false;

  @override
  void initState() {
    var d = const Duration(seconds: 3);
    // delayed 3 seconds to next page
    Future.delayed(d, () {
      //to next page and close this page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Scaffold(body: Main()),
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(),
              child: Center(
                child: Image.asset(
                  'assets/images/1.png',
                  height: 160,
                  width: 260,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Public Feedback System",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4,
                  height: 0.9,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
