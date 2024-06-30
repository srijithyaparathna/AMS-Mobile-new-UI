// homepage.dart
import 'package:appointmentms/pages/Login/Lecturer_login.dart';
import 'package:appointmentms/pages/Login%20S/studentLogin.dart';
import 'package:appointmentms/widgets/ButtonText.dart';
import 'package:appointmentms/widgets/TopWaveLogin.dart';
import 'package:appointmentms/widgets/bottomwave.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/widgets/app_largetext.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Choose Role'; // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopWave(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 35),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding:
                EdgeInsets.all(16.0), // Optional padding inside the container
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // Border color and width
              borderRadius:
                  BorderRadius.circular(8.0), 
                  
            ),
            child: Column(
              children: [
                SizedBox(height: 50.0),
                AppLargeText(text: "APPOINTMENT MANAGEMENT"),
                AppLargeText(text: "SYSTEM"),
                SizedBox(height: 30.0),
                AppLargeText(text: "FACULTY OF ENGINEERING"),
               
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  BottomWaveBar(),
    );
  }

  void _showMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(10, 100, 0, 0), // Adjust the position as needed
      items: [
        PopupMenuItem(
          value: 'Lecturer',
          child:  ButtonText(text: "STAFF"), // You can customize the appearance here
        ),
        PopupMenuItem(
          value: 'Student',
          child: ButtonText(text: "STUDENT"), // You can customize the appearance here
        ),
      ],
    );

    if (result != null) {
    // Handle the selected value (result) here
    

    // Navigate based on the selected role
    if (result == 'Lecturer') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  LectureLogin(), 
        ),
      );
    } else if (result == 'Student') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentLogin(), 
        ),
      );
    }
  }
}
}