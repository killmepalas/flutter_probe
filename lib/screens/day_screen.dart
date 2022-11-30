import 'package:fit_app/design/my_custom_painter.dart';
import 'package:flutter/material.dart';

import '../structures/my_type.dart';
import 'package:fit_app/structures/week.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({
    super.key,
    required this.week,
  });

  final Week week;

  @override
  Widget build(BuildContext context) {
    MyType toOtherPeople = week.effectiveness();
    MyType toOtherWeek = week.effectiveness();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 224, 222, 222),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 215, 213, 213),
          shadowColor: Color.fromARGB(255, 141, 139, 139),
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("СТАТИСТИКА ДНЯ", style: TextStyle(color: Colors.black)),
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 5)),
                Text(
                    week.days[0].day.day.toString() +
                        "." +
                        week.days[0].day.month.toString(),
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
                          title: Text('Меню',
                              style: TextStyle(color: Colors.black))),
                      body: Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 141, 139, 139)),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => false);
                              },
                              child: Text('Статистика недели')),
                          Padding(padding: EdgeInsets.only(left: 15)),
                          Text(
                            'Статистика дня',
                            style: TextStyle(color: Colors.black),
                          ),
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
            children: [
              Expanded(
                flex: 5,
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 8),
                    child: Column(children: [
                      ClipOval(
                          child: SizedBox.fromSize(
                              size: Size.fromRadius(100), // Image radius
                              child: Image.asset(
                                "assets/images/ben.png",
                                width: 320,
                                height: 300,
                              ))),
                      CustomPaint(
                        painter: TapePainter(),
                        child: Container(
                          height: 30,
                          width: 500,
                        ),
                      )
                    ])),
              ),
              Expanded(
                  flex: 1,
                  child: CustomPaint(
                    painter: LinePainter(),
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                    ),
                  )),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Wrap(children: [
                          Icon(
                            Icons.directions_run,
                            size: 70,
                            color: Color.fromARGB(255, 19, 125, 42),
                          ),
                          Column(children: [
                            Text(
                              week.days[0].steps.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'шагов',
                              textAlign: TextAlign.start,
                            ),
                          ])
                        ])),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      Icon(Icons.map_rounded),
                                      Text(week.days[0].km.toString(),
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600)),
                                      Padding(
                                          padding: EdgeInsets.only(left: 2)),
                                      Text("км",
                                          style: TextStyle(fontSize: 15)),
                                    ],
                                  )),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.fireplace,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                        Text(
                                          week.days[0].kkal.toString(),
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          ' кКал',
                                          textAlign: TextAlign.end,
                                        ),
                                      ])),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            Text(
                              'На ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Text(toOtherWeek.percent.toString() + '%',
                                style: TextStyle(
                                    color: toOtherWeek.color,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500)),
                            Text(' лучше, чем на прошлой неделе',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30)),
                          ],
                        )),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          children: [
                            Text('Лучше, чем другие пользователи, на',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30)),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Text(toOtherPeople.percent.toString() + '%',
                                style: TextStyle(
                                    color: toOtherPeople.color,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ))
                  ]),
                ),
              ),
            ],
          ),
        ]));
    // TODO: implement build
    throw UnimplementedError();
  }
}
