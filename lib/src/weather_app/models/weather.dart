import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Weather {
  final int id;
  final String day;
  final String asset;
  final double celsius;
  final IconData icon;
  final List<Color> colors;

  const Weather(this.id,
      {this.celsius, this.asset, this.day, this.icon, this.colors});
}

class WeatherProvider with ChangeNotifier {
  static const _weathers = [
    Weather(
      0,
      celsius: 29.0,
      asset: '',
      day: 'Today',
      icon: FontAwesomeIcons.cloudRain,
      colors: [Colors.cyan, Colors.cyanAccent],
    ),
    Weather(
      1,
      celsius: 28.0,
      asset: '',
      day: 'Monday',
      icon: FontAwesomeIcons.pooStorm,
      colors: [Colors.lightBlue, Colors.lightBlueAccent],
    ),
    Weather(
      2,
      celsius: 9.0,
      asset: '',
      day: 'Tuesday',
      icon: FontAwesomeIcons.cloudRain,
      colors: [Colors.yellow, Colors.yellowAccent],
    ),
  ];

  List<Weather> get weathers => _weathers;

  Weather _currentWeather = _weathers.first;
  Weather get current => _currentWeather;
  set current(Weather value) {
    _currentWeather = value;
    notifyListeners();
  }
}
