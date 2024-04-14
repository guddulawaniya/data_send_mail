import 'dart:async';

import 'package:data_send_mail/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: false);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    _getData();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController when the widget is disposed
    animationController.dispose();
    super.dispose();
  }

  Future<void> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('key'); // Retrieve string data
    if (data != null) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const MyHomePage(title: 'Form Registration'),
        ),
      );
      print('Retrieved data: $data');
    } else {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: const loginpage(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.lightBlue, Colors.white],
          ),
        ),
        child: ScaleTransition(
          scale: animation,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_3_outlined, size: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
