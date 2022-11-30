import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'day.dart';
import 'my_type.dart';

class Week {
  List<Day> days = [];
  int purposeSteps = 0;
  int purposeKkal = 0;

  Week(this.days, this.purposeSteps, this.purposeKkal);

  int getEffectivness() {
    int eff = 70;
    return eff;
  }

  int sumSteps() {
    int sum = 0;
    for (var n in days) {
      sum += n.steps;
    }
    return sum;
  }

  int sumKm() {
    int sum = 0;
    for (var n in days) {
      sum += n.km;
    }
    return sum;
  }

  int sumKkal() {
    int sum = 0;
    for (var n in days) {
      sum += n.kkal;
    }
    return sum;
  }

  MyType effectiveness() {
    MyType eff = MyType();
    eff.percent = Random().nextInt(200) - 100;
    if (eff.percent > 0) {
      eff.color = Color.fromARGB(255, 5, 160, 13);
    } else if (eff.percent < 0)
      eff.color = Color.fromARGB(255, 210, 114, 12);
    else
      eff.color = Color.fromARGB(255, 141, 189, 17);
    return eff;
  }

  List<int> zones() {
    List<int> zone = [0, 0, 0, 0, 0];
    for (var n in days) {
      zone[0] += n.zones.recovery_zone;
      zone[1] += n.zones.fat_burning_zone;
      zone[2] += n.zones.training_zone;
      zone[3] += n.zones.limit_activity_zone;
      zone[4] += n.zones.zone_of;
    }
    int sum = 0;
    for (int i = 0; i < 5; i++) {
      sum += zone[i];
    }

    for (int i = 0; i < 5; i++) {
      zone[i] = ((zone[i] / sum) * 100).round();
    }

    return zone;
  }

  bool isNullZone() {
    List<int> zone = zones();
    int sum = 0;
    bool nul = false;
    for (var n in zone) {
      sum += n;
    }
    if (sum != 0) nul = true;
    return nul;
  }

  MyType type_of_activity() {
    MyType type = MyType();
    if (sumKkal() >= 3500) {
      type.activity = "Очень высокая активность";
      type.color = Color.fromARGB(255, 32, 123, 9);
    } else if (sumKkal() >= 2500) {
      type.activity = "Высокая активность";
      type.color = Color.fromARGB(255, 60, 197, 14);
    } else if (sumKkal() >= 1500) {
      type.activity = "Умеренная активность";
      type.color = Color.fromARGB(255, 199, 184, 16);
    } else {
      type.activity = "Низкая активность";
      type.color = Color.fromARGB(255, 227, 110, 14);
    }
    return type;
  }
}
