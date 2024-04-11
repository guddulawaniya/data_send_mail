import 'package:flutter/material.dart';


class CustomAutocomplete extends StatefulWidget {
  final String text;
  final String hinttext;
  final List<String> items;
  final ValueChanged<String>? onChanged;

  const CustomAutocomplete({
    Key? key,
    required this.text,
    required this.hinttext,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomAutocompleteState createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  String? dropdownValue;

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
          Container(
            padding: const EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            width: double.infinity,
            child: DropdownButton(
              value: dropdownValue,
              underline: Container(),
              icon: const Icon(Icons.keyboard_arrow_down),
              style: const TextStyle(
                  color: Colors.black

              ),
              isExpanded: true,
              hint: const Text('select'),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
                widget.onChanged?.call(newValue ?? '');
              },

            ),
          ),
        ],
      ),
    );

  }
}
