import 'package:fit_app/structures/Week.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

Widget steps_graph(BuildContext context, Week week) {
  final fromDate = week.days[0].day;
  final toDate = week.days[6].day;
  final date1 = fromDate.add(Duration(days: 1));
  final date2 = fromDate.add(Duration(days: 2));
  final date3 = fromDate.add(Duration(days: 3));
  final date4 = fromDate.add(Duration(days: 4));
  final date5 = fromDate.add(Duration(days: 5));

  return Center(
    child: Card(
      elevation: 12,
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 2.9,
        child: BezierChart(
          bezierChartScale: BezierChartScale.WEEKLY,
          fromDate: fromDate,
          toDate: toDate,
          series: [
            BezierLine(
              label: "Steps",
              lineColor: Color.fromARGB(255, 2, 94, 46),
              onMissingValue: (dateTime) {
                if (dateTime.month.isEven) {
                  return 10.0;
                }
                return 5.0;
              },
              data: [
                DataPoint<DateTime>(
                    value: week.days[0].steps.toDouble(), xAxis: fromDate),
                DataPoint<DateTime>(
                    value: week.days[1].steps.toDouble(), xAxis: date1),
                DataPoint<DateTime>(
                    value: week.days[2].steps.toDouble(), xAxis: date2),
                DataPoint<DateTime>(
                    value: week.days[3].steps.toDouble(), xAxis: date3),
                DataPoint<DateTime>(
                    value: week.days[4].steps.toDouble(), xAxis: date4),
                DataPoint<DateTime>(
                    value: week.days[5].steps.toDouble(), xAxis: date5),
                DataPoint<DateTime>(
                    value: week.days[6].steps.toDouble(), xAxis: toDate),
              ],
            ),
            BezierLine(
              label: "Minimum",
              lineStrokeWidth: 1,
              lineColor: Colors.black,
              onMissingValue: (value) => week.purposeSteps.toDouble(),
              data: [
                DataPoint<DateTime>(
                    value: week.purposeSteps.toDouble(), xAxis: fromDate),
                DataPoint<DateTime>(
                    value: week.purposeSteps.toDouble(), xAxis: toDate),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 2.0,
            verticalIndicatorColor: Colors.black12,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            snap: true,
            contentWidth: MediaQuery.of(context).size.width / 3,
            footerHeight: 38.0,
            displayYAxis: true,
            stepsYAxis: 3000,
            backgroundGradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 5, 175, 84),
                Color.fromARGB(255, 51, 204, 122),
                Color.fromARGB(255, 85, 209, 143),
                Color.fromARGB(255, 100, 181, 137),
                Color.fromARGB(255, 154, 203, 176),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
    ),
  );
}
