import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Weather {
  final int id;
  final String day;
  final String asset;
  final double celsius;
  final IconData icon;
  final List<Color> colors;

  const Weather(
    this.id, {
    this.celsius,
    this.asset,
    this.day,
    this.icon,
    this.colors,
  });
}

class WeatherProvider with ChangeNotifier {
  static const _weathers = [
    Weather(
      0,
      celsius: 29.0,
      asset: 'snow',
      day: 'Today',
      icon: FontAwesomeIcons.cloudRain,
      colors: [
        Color.fromRGBO(154, 252, 233, 1),
        Color.fromRGBO(120, 236, 226, 1),
      ],
    ),
    Weather(
      1,
      celsius: 28.0,
      asset: 'flash',
      day: 'Monday',
      icon: FontAwesomeIcons.pooStorm,
      colors: [
        Color.fromRGBO(135, 237, 252, 1),
        Color.fromRGBO(101, 214, 251, 1),
      ],
    ),
    Weather(
      2,
      celsius: 9.0,
      asset: 'rain',
      day: 'Tuesday',
      icon: FontAwesomeIcons.cloudRain,
      colors: [
        Color.fromRGBO(255, 254, 188, 1),
        Color.fromRGBO(232, 223, 177, 1),
      ],
    ),
  ];

  List<Weather> get weathers => _weathers;

  Weather _currentWeather = _weathers.first;
  Weather get current => _currentWeather;
  set current(Weather value) {
    _currentWeather = value;
    notifyListeners();
  }

  PageController _controller = PageController();
  PageController get controller => _controller;
}
