import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenges/src/weather_app/models/weather.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Stack(
        children: [
          _Background(),
          _CoolAssets(),
        ],
      ),
    );
  }
}

class _CoolAssets extends StatelessWidget {
  const _CoolAssets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: PageView.builder(
          onPageChanged: (value) => provider.current = provider.weathers[value],
          itemCount: 7,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
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
        gradient: RadialGradient(colors: provider.current.colors),
      ),
    );
  }
}
