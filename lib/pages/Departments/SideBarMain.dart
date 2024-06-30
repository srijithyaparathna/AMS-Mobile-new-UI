import 'package:appointmentms/pages/CalenderViews/Shedule.dart';
import 'package:appointmentms/pages/Departments/DepartmentView.dart';
import 'package:appointmentms/pages/Login%20S/studentLogin.dart';
import 'package:appointmentms/pages/homepage.dart';
import 'package:appointmentms/widgets/SideBartext.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class SideBarMain extends StatefulWidget {
  const SideBarMain({Key? key});

  @override
  State<SideBarMain> createState() => _SideBarMainState();
}

class _SideBarMainState extends State<SideBarMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: Color.fromARGB(255, 88, 40, 128),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              ButtonText1(text: "Appointment Management System"),
              ButtonText1(text: "--------------------------------"),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 251, 248, 249),
                ),
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Home"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.login,
                  color: Color.fromARGB(255, 246, 242, 242),
                ),
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Login"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentLogin(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance,
                  color: Color.fromARGB(255, 246, 241, 242),
                ),
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Department"),
                onTap: () {
                  DateTime today = DateTime.now();
                  var selectedDate;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepartmentView(),
                    ),
                  );
                },
              ),
              
              ListTile(
                leading: Icon(
                  Icons.event_note,
                  color: Color.fromARGB(255, 247, 243, 244),
                ),
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "My Appointments"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Shedule(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 250, 247, 247),
                ),
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Logout"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
