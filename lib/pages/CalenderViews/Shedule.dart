import 'package:appointmentms/pages/CalenderViews/TopCalenderWave.dart';
import 'package:appointmentms/widgets/SideBar.dart';
import 'package:appointmentms/widgets/bottomwave.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Shedule extends StatefulWidget {
  const Shedule({super.key});

  @override
  State<Shedule> createState() => _SheduleState();
}

class _SheduleState extends State<Shedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToppCalenderWave(),
      drawer: SideBar(),
      body: SfCalendar(
        view: CalendarView.schedule,
      ),
      bottomNavigationBar: BottomWaveBar(),
    );
  }
}