import 'dart:math';

import 'package:fit_app/screens/DayScreen.dart';
import 'package:fit_app/screens/WeekScreen.dart';
import 'package:fit_app/structures/Day.dart';
import 'package:fit_app/structures/Zones.dart';
import 'package:fit_app/structures/Week.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => WeekScreen(week: createWeek()),
      '/today': (context) => DayScreen(week: createWeek()),
    },
    debugShowCheckedModeBanner: false,
  ));
}

Week createWeek() {
  List<Day> days = [];
  DateTime date = DateTime(2022, 10, 31);
  for (int i = 0; i < 7; i++) {
    //data for week
    int steps = Random().nextInt(15000) + 1000;
    int km = Random().nextInt(7) + 3;
    int kkal = Random().nextInt(700) + 100;
    DateTime day = date.add(Duration(days: i));

    //data for zones
    var list = [];
    for (int i = 0; i < 5; i++) {
      list.add(Random().nextInt(100));
    }

    //creating
    Zones zones = Zones(list[0], list[1], list[2], list[3], list[4]);
    days.add(Day(steps, km, kkal, day, zones));
  }

  int purposeSteps = Random().nextInt(5000) + 5000;
  int purposeKkal = Random().nextInt(400) + 300;
  return Week(days, purposeSteps, purposeKkal);
}
