import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final bool issmall;
  const BigText({
    Key? key,
    required this.text,
    this.issmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: issmall ? Alignment.centerLeft : Alignment.center,
      child: Text(text, style: TextStyle(fontSize: issmall ? 22 : 26, color: Colors.black, fontWeight: FontWeight.w700)),
    );
  }
}
