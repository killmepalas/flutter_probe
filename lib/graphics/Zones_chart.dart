import 'package:fit_app/structures/Zones.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fit_app/structures/week.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color? color;
}

Widget ZonesChart(BuildContext context, Week week) {
  List<int> zones = week.zones();
  return Center(
      child: Container(
          padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 239, 239),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 500,
          height: 275,
          child: SfCircularChart(
              legend: Legend(isVisible: true),
              title: ChartTitle(
                  text: 'Зоны тренировок',
                  textStyle:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
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
