import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final String hinttext;

  const CustomTextView({super.key, required this.text, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  // Define your text style here
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const Text(
                "*",
                style: TextStyle(
                  // Define your text style here
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              hintText: hinttext,
              border: const OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}