import 'package:appointmentms/widgets/TopwaveDepartment.dart';
import 'package:appointmentms/widgets/bottomwave.dart';
import 'package:flutter/material.dart';
import 'package:appointmentms/widgets/app_largetext.dart';

class DepartmentView extends StatefulWidget {
  const DepartmentView({Key? key}) : super(key: key);

  @override
  _DepartmentViewState createState() => _DepartmentViewState();
}

class _DepartmentViewState extends State<DepartmentView> {
  String dropdownValue = 'Choose Role'; // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopWaveDepartment(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 35),
        child: Container(
          padding:
              EdgeInsets.all(16.0), // Optional padding inside the container
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Border color and width
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              AppLargeText(text: "APPOINTMENT MANAGEMENT"),
              AppLargeText(text: "SYSTEM"),
              SizedBox(height: 30.0),
              AppLargeText(text: "FACULTY OF ENGINEERING"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomWaveBar(),
    );
  }
}