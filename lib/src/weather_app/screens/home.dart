import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'package:ui_challenges/src/weather_app/models/weather.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Theme(
        data: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        child: Material(
          child: Stack(
            children: [
              _Background(),
              _Content(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'SAIGON',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          _CoolAssets(),
          Flexible(child: _WeatherSlider()),
        ],
      ),
    );
  }
}

class _WeatherSlider extends StatelessWidget {
  const _WeatherSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Column(
      children: [
        Text(
          provider.current.day.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var weather in provider.weathers)
              _WeatherItem(weather: weather),
          ],
        ),
      ],
    );
  }
}

class _WeatherItem extends StatelessWidget {
  const _WeatherItem({Key key, @required this.weather}) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return GestureDetector(
      onTap: () {
        provider.current = weather;
        provider.controller.animateToPage(
          weather.id,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
        );
      },
      child: Card(
        color: provider.current == weather ? Colors.white : Colors.transparent,
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(weather.icon, size: 35.0),
              SizedBox(height: 10.0),
              Text(
                '${weather.celsius.toStringAsFixed(0)}°',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoolAssets extends StatelessWidget {
  const _CoolAssets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      child: PageView.builder(
        controller: provider.controller,
        itemCount: provider.weathers.length,
        onPageChanged: (value) => provider.current = provider.weathers[value],
        itemBuilder: (context, i) {
          final item = provider.weathers[i];

          return Container(
            margin: EdgeInsets.all(40.0),
            child: Column(
              children: [
                Text(
                  '${item.celsius.toStringAsFixed(0)}°',
                  style: TextStyle(color: Colors.black, fontSize: 130.0),
                ),
                Flexible(
                  child: FlareActor(
                    'assets/weather_app/UIChallenge.flr',
                    artboard: item.asset,
                    animation: item.asset,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: provider.current.colors),
      ),
    );
  }
}
