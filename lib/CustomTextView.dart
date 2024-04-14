import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatefulWidget {
  final String text;
  final String? errortext;
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
    this.errortext,
    required this.inputType, this.maxlenght,
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
            onChanged: widget.onChanged,
            autocorrect: true,
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
              errorText: widget.errortext, // Show error message
            ),
          )
        ],
      ),
    );
  }
}
