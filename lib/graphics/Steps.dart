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
    Color.fromARGB(255, 96, 144, 113),
    Color.fromARGB(255, 213, 213, 213),
  ],
  // Setting alignment for the series gradient
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

Widget StepsGraph(BuildContext context, Week week) {
  return Center(
      child: Container(
          width: 500,
          height: 150,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              plotAreaBorderWidth: 0,
              primaryYAxis: NumericAxis(
                  plotBands: <PlotBand>[
                    PlotBand(
                        isVisible: true,
                        start: week.purposeSteps,
                        end: week.purposeSteps,
                        borderWidth: 2,
                        dashArray: <double>[5, 5],
                        borderColor: Colors.black,
                        text: week.purposeSteps.toString() + "\nшагов",
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
                      ChartData("Пн", week.days[0].steps),
                      ChartData("Вт", week.days[1].steps),
                      ChartData("Ср", week.days[2].steps),
                      ChartData("Чт", week.days[3].steps),
                      ChartData("Пт", week.days[4].steps),
                      ChartData("Сб", week.days[5].steps),
                      ChartData("Вс", week.days[6].steps),
                    ],
                    gradient: _linearGradient,
                    borderWidth: 5,
                    borderColor: Color.fromARGB(255, 35, 114, 62),
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y),
              ])));
}
