import 'package:fit_app/structures/Week.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

Widget kkal_graph(BuildContext context, Week week) {
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
              label: "Kkal",
              lineColor: Color.fromARGB(255, 80, 2, 2),
              onMissingValue: (dateTime) {
                if (dateTime.month.isEven) {
                  return 10.0;
                }
                return 5.0;
              },
              data: [
                DataPoint<DateTime>(
                    value: week.days[0].kkal.toDouble(), xAxis: fromDate),
                DataPoint<DateTime>(
                    value: week.days[1].kkal.toDouble(), xAxis: date1),
                DataPoint<DateTime>(
                    value: week.days[2].kkal.toDouble(), xAxis: date2),
                DataPoint<DateTime>(
                    value: week.days[3].kkal.toDouble(), xAxis: date3),
                DataPoint<DateTime>(
                    value: week.days[4].kkal.toDouble(), xAxis: date4),
                DataPoint<DateTime>(
                    value: week.days[5].kkal.toDouble(), xAxis: date5),
                DataPoint<DateTime>(
                    value: week.days[6].kkal.toDouble(), xAxis: toDate),
              ],
            ),
            BezierLine(
              label: "Minimum",
              lineStrokeWidth: 1,
              lineColor: Colors.black,
              onMissingValue: (value) => week.purposeKkal.toDouble(),
              data: [
                DataPoint<DateTime>(
                    value: week.purposeKkal.toDouble(), xAxis: fromDate),
                DataPoint<DateTime>(
                    value: week.purposeKkal.toDouble(), xAxis: toDate),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 2.0,
            verticalIndicatorColor: Colors.black12,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            footerHeight: 38.0,
            displayYAxis: true,
            snap: true,
            stepsYAxis: 150,
            backgroundGradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 206, 0, 0),
                Color.fromARGB(255, 225, 37, 37),
                Color.fromARGB(255, 231, 71, 71),
                Color.fromARGB(255, 200, 91, 91),
                Color.fromARGB(255, 182, 106, 106),
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
