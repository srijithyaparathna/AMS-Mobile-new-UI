import 'package:flutter/material.dart';

class TopWaveWithoutMenuIcon extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;

  TopWaveWithoutMenuIcon({Key? key})
      : preferredSize = Size.fromHeight(150.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 150.0,
            color: const Color(0xFFF0F2F8),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 28),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 28),
              
            ),
          ],
          flexibleSpace: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 10,right: 200),
              child: Image.asset(
                'assets/imag.png',
                height: 85.0,
                width: 131.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height - 80, size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
