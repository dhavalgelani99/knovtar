import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  final String main;
  final String sub;
  const DetailText({Key? key,
  required this.main,
  required this.sub,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 8),
      child: RichText(text: TextSpan(
          text: main,
          style: const TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
          children: [
            TextSpan(
              text: sub,
              style: const TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w400),
            )
          ]
      ),),
    );
  }
}
