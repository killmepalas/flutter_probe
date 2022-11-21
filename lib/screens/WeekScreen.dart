import 'package:fit_app/graphics/Kkal.dart';
import 'package:fit_app/graphics/Zones_chart.dart';
import 'package:fit_app/structures/Week.dart';
import 'package:fit_app/structures/MyType.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/graphics/Steps.dart';

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
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("СТАТИСТИКА НЕДЕЛИ"),
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
              ),
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
                                  context, '/today', (route) => false);
                            },
                            child: Text('Статистика дня')),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        Text('Статистика недели'),
                      ],
                    ));
              }));
            },
            icon: Icon(Icons.menu_outlined),
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.fromLTRB(20, 20, 30, 20), children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      week.sumSteps().toString(),
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
                                right: MediaQuery.of(context).size.width / 6)),
                        Row(
                          children: [
                            Icon(Icons.map_rounded),
                            Text(week.sumKm().toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            Padding(padding: EdgeInsets.only(left: 2)),
                            Text(" км", style: TextStyle(fontSize: 15)),
                          ],
                        )
                      ],
                    ),
                    if (week.sumSteps() != 0)
                      steps_graph(context, week)
                    else
                      Text(
                        "Нет данных о шагах за этот период",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    Text('Цель - ' + week.purposeSteps.toString() + " шагов",
                        style: TextStyle(color: Color.fromARGB(115, 0, 0, 0))),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      week.sumKkal().toString(),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                    Text('кКал'),
                    if (week.sumKkal() != 0)
                      kkal_graph(context, week)
                    else
                      Text(
                        "Нет данных о кКал за этот период",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
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
                  Text('Продуктивность\nнедели', textAlign: TextAlign.center),
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
        ),
        Text('Эффективность - достижение поставленной цели',
            style: TextStyle(color: Color.fromARGB(115, 0, 0, 0))),
        Padding(padding: EdgeInsets.only(top: 10)),
        if (week.isNullZone())
          zones_chart(context, week)
        else
          Text(
            "Нет данных о тренировках за этот период",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
      ]),
    );
  }
}
