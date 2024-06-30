import 'package:appointmentms/pages/CalenderViews/DailyView.dart';
import 'package:appointmentms/pages/CalenderViews/MonthlyView.dart';
import 'package:appointmentms/pages/CalenderViews/Shedule.dart';
import 'package:appointmentms/pages/CalenderViews/ThreedaysView.dart';
import 'package:appointmentms/pages/CalenderViews/WeeklyView.dart';
import 'package:appointmentms/widgets/Sidebartext.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class SideBar extends StatefulWidget {
  const SideBar({ Key? key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Drawer(
        backgroundColor: Color.fromARGB(255, 88, 40, 128),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            
            children: [
              SizedBox(height: 30,),
              
              ButtonText1(text: "Appointment Management System"),
              ButtonText1(text: "-------------------------------------"),
              SizedBox(height: 20,),
              ListTile(
                leading: Icon(Icons.schedule_outlined,color: Color.fromARGB(255, 246, 242, 242),), 
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Schedule"),
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
                leading: Icon(Icons.view_day_outlined,color: Color.fromARGB(255, 246, 241, 242),), 
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Day"),
                onTap: () {
                  DateTime today = DateTime.now();
                  var selectedDate;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyView(selectedDate: today,), 
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.view_agenda_outlined,color: Color.fromARGB(255, 251, 248, 249),), 
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "3 Days"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThreeDaysView(), 
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.view_week_outlined,color: Color.fromARGB(255, 247, 243, 244),), 
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Week"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeeklyView(), 
                    ),
                  );
                },
              ),
              
              ListTile(
                leading: Icon(Icons.calendar_view_month_outlined,color:  Color.fromARGB(255, 250, 247, 247),), 
                selectedTileColor: Color.fromARGB(255, 123, 177, 221),
                title: ButtonText1(text: "Month"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MonthlyView(), 
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