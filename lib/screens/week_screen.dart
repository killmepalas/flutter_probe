import 'dart:js';

import 'package:fit_app/design/my_custom_painter.dart';
import 'package:fit_app/graphics/kkal.dart';
import 'package:fit_app/graphics/zones_chart.dart';
import 'package:fit_app/structures/week.dart';
import 'package:fit_app/structures/my_type.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/graphics/steps.dart';

class WeekScreen extends StatelessWidget {
  const WeekScreen({super.key, required this.week});

  final Week week;

  @override
  Widget build(BuildContext context) {
    MyType effectiveness = week.effectiveness();
    MyType productivity = week.effectiveness();
    MyType toOtherPeople = week.effectiveness();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 222, 222),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 215, 213, 213),
        shadowColor: Color.fromARGB(255, 141, 139, 139),
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "СТАТИСТИКА НЕДЕЛИ",
                style: TextStyle(color: Colors.black, fontFamily: 'Steppe'),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 5)),
              Text(
                  week.days[0].day.day.toString() +
                      "." +
                      week.days[0].day.month.toString() +
                      "-" +
                      week.days[6].day.day.toString() +
                      "." +
                      week.days[6].day.month.toString(),
                  style: TextStyle(color: Colors.black)),
            ]),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Scaffold(
                    backgroundColor: Color.fromARGB(255, 224, 222, 222),
                    appBar: AppBar(
                        backgroundColor: Color.fromARGB(255, 215, 213, 213),
                        shadowColor: Color.fromARGB(255, 141, 139, 139),
                        title: Text(
                          'Меню',
                          style: TextStyle(color: Colors.black),
                        )),
                    body: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 141, 139, 139)),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/today', (route) => false);
                            },
                            child: Text('Статистика дня',
                                style: TextStyle(color: Colors.white))),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        Text('Статистика недели',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ));
              }));
            },
            icon: Icon(
              Icons.menu_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.fromLTRB(20, 20, 20, 20), children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 6,
                child: Container(
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
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Text(
                              week.sumSteps().toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w700),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text('шагов')),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Row(
                              children: [
                                Icon(Icons.map_rounded),
                                Text(week.sumKm().toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                Padding(padding: EdgeInsets.only(left: 2)),
                                Text("км", style: TextStyle(fontSize: 15)),
                              ],
                            )
                          ],
                        ),
                        if (week.sumSteps() != 0)
                          StepsGraph(context, week)
                        else
                          Text(
                            "Нет данных о шагах за этот период",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: CustomPaint(painter: LinePainter())),
            Expanded(
                flex: 6,
                child: Container(
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
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(week.sumKkal().toString(),
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text('кКал')),
                        if (week.sumKkal() != 0)
                          KkalGraph(context, week)
                        else
                          Text(
                            "Нет данных о кКал за этот период",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 30)),
        Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 5,
                right: MediaQuery.of(context).size.width / 5),
            padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 215, 213, 213),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Эффективность\nтренировок',
                          textAlign: TextAlign.center),
                      Text(
                        effectiveness.percent.toString() + '%',
                        style: TextStyle(
                            color: effectiveness.color,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Продуктивность\nнедели',
                          textAlign: TextAlign.center),
                      Text(productivity.percent.toString() + '%',
                          style: TextStyle(
                              color: productivity.color,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Лучше, чем другие\nпользователи на',
                          textAlign: TextAlign.center),
                      Text(toOtherPeople.percent.toString() + '%',
                          style: TextStyle(
                              color: toOtherPeople.color,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(children: [
                    if (week.type_of_activity().activity == "Низкая активность")
                      Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: week.type_of_activity().color,
                        size: 60,
                      )
                    else if (week.type_of_activity().activity ==
                        "Умеренная активность")
                      Icon(
                        Icons.sentiment_neutral,
                        color: week.type_of_activity().color,
                        size: 60,
                      )
                    else if (week.type_of_activity().activity ==
                        "Высокая активность")
                      Icon(
                        Icons.sentiment_satisfied,
                        color: week.type_of_activity().color,
                        size: 60,
                      )
                    else
                      Icon(
                        Icons.sentiment_very_satisfied,
                        color: week.type_of_activity().color,
                        size: 60,
                      ),
                    Text(
                      week.type_of_activity().activity,
                      style: TextStyle(color: week.type_of_activity().color),
                    ),
                  ]),
                ),
              ],
            )),
        Padding(padding: EdgeInsets.only(top: 30)),
        if (week.isNullZone())
          ZonesChart(context, week)
        else
          Text(
            "Нет данных о тренировках за этот период",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
      ]),
    );
  }
}
