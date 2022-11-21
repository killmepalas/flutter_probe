import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'Day.dart';
import 'MyType.dart';

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
      eff.color = Color.fromARGB(255, 202, 12, 12);
    else
      eff.color = Color.fromARGB(255, 247, 152, 8);
    return eff;
  }

  List<int> zones() {
    List<int> zones = [0, 0, 0, 0, 0];
    for (var n in days) {
      zones[0] += n.zones.recovery_zone;
      zones[1] += n.zones.fat_burning_zone;
      zones[2] += n.zones.training_zone;
      zones[3] += n.zones.limit_activity_zone;
      zones[4] += n.zones.zone_of;
    }
    return zones;
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
      type.color = Color.fromARGB(255, 255, 106, 0);
    } else {
      type.activity = "Низкая активность";
      type.color = Color.fromARGB(255, 244, 49, 36);
    }
    return type;
  }
}
