import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
   BottomText({Key? key, 
    this.size =30,
    required this.text,
    this.color = Colors.black}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        
        color: Color(0xFF500512),
        fontSize: 15,
        fontWeight: FontWeight.bold,
        
      ),

    );
  }
}