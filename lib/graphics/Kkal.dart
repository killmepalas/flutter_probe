import 'package:fit_app/structures/week.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}

// Initializing the gradient variable for the series.
final LinearGradient _linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 165, 92, 86),
    Color.fromARGB(255, 202, 175, 173),
    Color.fromARGB(255, 219, 218, 218),
  ],
  // Setting alignment for the series gradient
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

Widget KkalGraph(BuildContext context, Week week) {
  return Center(
      child: Container(
          width: 500,
          height: 150,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  plotBands: <PlotBand>[
                    PlotBand(
                        isVisible: true,
                        start: week.purposeKkal,
                        end: week.purposeKkal,
                        borderWidth: 2,
                        dashArray: <double>[5, 5],
                        borderColor: Colors.black,
                        text: week.purposeKkal.toString() + "\nкКал",
                        horizontalTextAlignment: TextAnchor.end,
                        verticalTextAlignment: TextAnchor.start,
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                        shouldRenderAboveSeries: true)
                  ],
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0)),
              title: ChartTitle(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              series: <ChartSeries<ChartData, String>>[
                // Render pie chart
                SplineAreaSeries<ChartData, String>(
                    dataSource: [
                      // Bind data source
                      ChartData("Пн", week.days[0].kkal),
                      ChartData("Вт", week.days[1].kkal),
                      ChartData("Ср", week.days[2].kkal),
                      ChartData("Чт", week.days[3].kkal),
                      ChartData("Пт", week.days[4].kkal),
                      ChartData("Сб", week.days[5].kkal),
                      ChartData("Вс", week.days[6].kkal),
                    ],
                    borderColor: Color.fromARGB(255, 125, 14, 6),
                    borderWidth: 5,
                    gradient: _linearGradient,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ])));
}
