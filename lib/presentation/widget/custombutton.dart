import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Function func;
  const CustomButton({
    Key? key,
    required this.name,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.blue.shade800
        ),
        child: Text(name, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
      ),
    );
  }
}
