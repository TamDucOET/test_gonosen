//Packages
import 'package:flutter/material.dart';

class TextNormal extends StatelessWidget {
  const TextNormal({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
    );
  }
}
