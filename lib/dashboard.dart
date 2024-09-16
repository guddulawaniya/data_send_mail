
import 'package:flutter/material.dart';

class dashboardpage extends StatefulWidget {
  const dashboardpage({super.key});

  @override
  State<dashboardpage> createState() => _dashboardpageState();
}
class _dashboardpageState extends State<dashboardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Dashboard",style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),),
        backgroundColor: Colors.blue.shade600,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("data")
            ],
          )
        ],
      ),


    );
  }
}
