import 'package:appointmentms/pages/Departments/DepartmentView.dart';
import 'package:appointmentms/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
   
    return MaterialApp(
      title: 'Blank Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,

      home:  HomePage(),

         );
  }
}


