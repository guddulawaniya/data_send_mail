import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatefulWidget {
  final String text;
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final int? maxlenght;
  final void Function(String)? onChanged;

  const CustomTextView({
    Key? key,
    required this.text,
    required this.hinttext,
    required this.controller,
    this.validator,
    this.onChanged,
    this.maxlenght,
    required this.inputType,
  }) : super(key: key);

  @override
  _CustomTextViewState createState() => _CustomTextViewState();
}

class _CustomTextViewState extends State<CustomTextView> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const Text(
                "*",
                style: TextStyle(
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
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            maxLength: widget.maxlenght,
            autocorrect: true,
            onChanged: (value) {
              setState(() {
                _errorText = null; // Clear error message on text change
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value); // Call onChanged callback
              }
            },
            validator: (value) {
              if (widget.validator != null) {
                return widget.validator!(value); // Validate input
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              hintText: widget.hinttext,
              counterText: "",
              border: const OutlineInputBorder(),
              errorText: _errorText, // Show error message
            ),
            onTap: () {
              setState(() {
                _errorText = null; // Clear error message on tap
              });
            },
          )
        ],
      ),
    );
  }
}
