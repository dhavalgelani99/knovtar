import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxlines;
  final String label;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.maxlines = 1,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8
      ),
      child: TextField(
        maxLines: maxlines,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
