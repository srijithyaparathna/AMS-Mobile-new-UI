import 'package:appointmentms/pages/Departments/Computer.dart';
import 'package:appointmentms/pages/Departments/DCEE.dart';
import 'package:appointmentms/pages/Departments/DEIE.dart';
import 'package:appointmentms/pages/Departments/DMME.dart';
import 'package:appointmentms/pages/Departments/Marine.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:flutter/material.dart';

class TopWaveDepartment extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;

  TopWaveDepartment({Key? key})
      : preferredSize = Size.fromHeight(150.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 220.0,
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
          
             flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 52, left: 10),
                child: Image.asset(
                  'assets/imag.png',
                  height: 85.0,
                  width: 131.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 75.0),
                    TextButton(
                      onPressed: () => _showMenu(context),
                      child: const Text(
                        'DEPARTMENTS',
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 0, 2),
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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


  void _showMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(10, 100, 0, 0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          value: 'DEIE',
          child: ButtonText(text: "DEIE"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'COMPUTER',
          child: ButtonText(text: "COMPUTER"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'DCEE',
          child: ButtonText(text: "DCEE"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'DMME',
          child: ButtonText(text: "DMME"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'MENA',
          child: ButtonText(text: "MENA"), // You can customize the appearance here
        ),
      ],
    );

    if (result != null) {
      // Handle the selected value (result) here

      // Navigate based on the selected role
      if (result == 'DEIE') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DEIE(),
          ),
        );
      } else if (result == 'COMPUTER') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => COM(),
          ),
        );
      } else if (result == 'DCEE') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DCEE(),
          ),
        );
      } else if (result == 'DMME') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DMME(),
          ),
        );
      } else if (result == 'MENA') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Marine(),
          ),
        );
      }
    }
  }


