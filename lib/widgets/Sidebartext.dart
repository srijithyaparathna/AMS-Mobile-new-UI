import 'package:flutter/material.dart';

class ButtonText1 extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  ButtonText1(
      {Key? key, this.size = 30, required this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 247, 245, 246),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
