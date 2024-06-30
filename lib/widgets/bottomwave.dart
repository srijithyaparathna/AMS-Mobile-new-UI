import 'package:flutter/material.dart';

class BottomWaveBar extends StatefulWidget {
  const BottomWaveBar({super.key});

  @override
  State<BottomWaveBar> createState() => _BottomWaveBarState();
}

class _BottomWaveBarState extends State<BottomWaveBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipPath(
        clipper: WaveClipper(),
        child: Container(
          height: 150,
          color: Color(0xFF8b22e2),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);

    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 6, size.height - 80, size.width / 3, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height - 40, 2 * size.width / 3, size.height - 60);
    path.quadraticBezierTo(
        5 * size.width / 6, size.height - 80, size.width, size.height - 70);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
