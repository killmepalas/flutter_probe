import 'package:fit_app/structures/Week.dart';
import 'package:flutter/material.dart';

import '../structures/MyType.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({
    super.key,
    required this.week,
  });

  final Week week;

  @override
  Widget build(BuildContext context) {
    MyType toOtherPeople = week.effectiveness();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 222, 222),
      appBar: AppBar(
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("СТАТИСТИКА ДНЯ"),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 2)),
              Text(week.days[0].day.day.toString() +
                  "." +
                  week.days[0].day.month.toString()),
            ]),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Scaffold(
                    appBar: AppBar(title: Text('Меню')),
                    body: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
                            },
                            child: Text('Статистика недели')),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        Text('Статистика дня'),
                      ],
                    ));
              }));
            },
            icon: Icon(Icons.menu_outlined),
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.fromLTRB(70, 20, 30, 20), children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      week.days[0].steps.toString(),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('шагов'),
                        Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width / 4.5)),
                        Row(
                          children: [
                            Icon(Icons.map_rounded),
                            Text(week.days[0].km.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            Padding(padding: EdgeInsets.only(left: 2)),
                            Text(" км", style: TextStyle(fontSize: 15)),
                          ],
                        )
                      ],
                    ),
                    Text('Цель - ' + week.purposeSteps.toString() + " шагов",
                        style: TextStyle(color: Color.fromARGB(115, 0, 0, 0))),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 70, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      week.days[0].kkal.toString(),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                    Text('кКал'),
                    Text("Цель - " + week.purposeKkal.toString() + "кКал",
                        style: TextStyle(color: Color.fromARGB(115, 0, 0, 0))),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Лучше, чем другие пользователи на',
                textAlign: TextAlign.center),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(toOtherPeople.percent.toString() + '%',
                style: TextStyle(
                    color: toOtherPeople.color,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ]),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
