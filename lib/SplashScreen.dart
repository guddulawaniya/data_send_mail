import 'dart:async';

import 'package:data_send_mail/login.dart';
import 'package:data_send_mail/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splash_screenState();
}
class _splash_screenState extends State<splashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  Future<void> hideScreen() async {
    Future.delayed(const Duration(milliseconds: 1800), () {
      FlutterSplashScreen.hide();
    });
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('key'); // Retrieve string data
    if (data != null) {
      Navigator.pushReplacement(context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: const MyHomePage(title: 'Form Registration')));
      print('Retrieved data: $data');
    } else {
      Timer(
          const Duration(seconds: 3), () => Navigator.pushReplacement(context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: const loginpage())));
    }
  }

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: false);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    _getData();
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
                colors: [
                  Colors.lightBlue,
                  Colors.white
                ]
            )
        ),
        child: ScaleTransition(
          scale: animation,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(Icons.person_3_outlined , size: 50, )
                // Image.asset(Icons.person_2_outlined as String,height: 100,width: 100,)
              ],
            ),
          ),
        ),
      ),

    );
  }
}
