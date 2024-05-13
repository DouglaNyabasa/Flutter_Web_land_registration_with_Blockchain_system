import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String label;
  const CustomTextField({super.key, required this.text, required this.label});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        readOnly: true,
        initialValue: text,
        style: const TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
            isDense: true, // Added this
            contentPadding: const EdgeInsets.all(12),
            border: const OutlineInputBorder(),
            labelText: label,
            labelStyle: const TextStyle(fontSize: 20),
            fillColor: Colors.grey,
            filled: true),
      ),
    );
  }
}
