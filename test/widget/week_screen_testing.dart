import 'dart:math';

import 'package:fit_app/main.dart';
import 'package:fit_app/screens/WeekScreen.dart';
import 'package:fit_app/structures/Day.dart';
import 'package:fit_app/structures/Week.dart';
import 'package:fit_app/structures/Zones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("WeekScreenTestingWidget", () {
    Widget createWidgetForTesting({required Widget child}) {
      return MaterialApp(
        home: child,
      );
    }

    //creating Week with 0 values
    Week create() {
      List<Day> days = [];
      DateTime date = DateTime(2022, 10, 31);
      for (int i = 0; i < 7; i++) {
        //data for week
        int steps = 0;
        int km = 0;
        int kkal = 0;
        DateTime day = date.add(Duration(days: i));

        //data for zones
        var list = [];
        for (int i = 0; i < 5; i++) {
          list.add(0);
        }

        //creating
        Zones zones = Zones(list[0], list[1], list[2], list[3], list[4]);
        days.add(Day(steps, km, kkal, day, zones));
      }

      int purposeSteps = Random().nextInt(5000) + 5000;
      int purposeKkal = Random().nextInt(400) + 300;
      return Week(days, purposeSteps, purposeKkal);
    }

    testWidgets("should has icons sentiment_very_dissatisfied",
        (widgetTester) async {
      Week week = create();

      await widgetTester.pumpWidget(createWidgetForTesting(
          child: new WeekScreen(
        week: week,
      )));
      var sadman = find.byIcon(Icons.sentiment_very_dissatisfied);
      expect(sadman, findsOneWidget);
    });

    testWidgets("should has Text about Steps", (widgetTester) async {
      Week week = create();

      await widgetTester.pumpWidget(createWidgetForTesting(
          child: new WeekScreen(
        week: week,
      )));
      var text = find.text("Нет данных о шагах за этот период");
      expect(text, findsOneWidget);
    });

    testWidgets("should has Text about kKal", (widgetTester) async {
      Week week = create();

      await widgetTester.pumpWidget(createWidgetForTesting(
          child: new WeekScreen(
        week: week,
      )));
      var text = find.text("Нет данных о кКал за этот период");
      expect(text, findsOneWidget);
    });

    testWidgets("should has Text about trainings", (widgetTester) async {
      Week week = create();

      await widgetTester.pumpWidget(createWidgetForTesting(
          child: new WeekScreen(
        week: week,
      )));
      var text = find.text("Нет данных о тренировках за этот период");
      expect(text, findsOneWidget);
    });

    testWidgets("should has Text about activity", (widgetTester) async {
      Week week = create();

      await widgetTester.pumpWidget(createWidgetForTesting(
          child: new WeekScreen(
        week: week,
      )));
      var text = find.text("Низкая активность");
      expect(text, findsOneWidget);
    });
  });
}
