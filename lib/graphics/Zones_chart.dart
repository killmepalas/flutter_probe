import 'package:fit_app/structures/Zones.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fit_app/structures/Week.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color? color;
}

Widget zones_chart(BuildContext context, Week week) {
  List<int> zones = week.zones();
  return Center(
      child: Container(
          width: 400,
          height: 280,
          child: SfCircularChart(
              legend: Legend(isVisible: true),
              title: ChartTitle(
                  text: 'Зоны тренировок',
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              series: <CircularSeries>[
                // Render pie chart
                PieSeries<ChartData, String>(
                    dataSource: [
                      // Bind data source
                      if (week.zones()[0] != 0)
                        ChartData("Зона восстановления", zones[0]),
                      if (week.zones()[1] != 0)
                        ChartData("Зона сжигания жиров", zones[1]),
                      if (week.zones()[2] != 0)
                        ChartData("Зона тренировки", zones[2]),
                      if (week.zones()[3] != 0)
                        ChartData("Зона предельных\nнагрузок", zones[3]),
                      if (week.zones()[4] != 0) ChartData("Зона ...", zones[4]),
                    ],
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ])));
}
