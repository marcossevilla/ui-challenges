import 'package:flutter/material.dart';

import 'src/apps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Challenges',
      home: _Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key key}) : super(key: key);

  static Map<String, Widget> pages = {
    'Food App': FoodApp(),
    'Charity App': CharityApp(),
    'Fitness App': FitnessApp(),
    'WhatsApp Redo': WhatsAppRedo(),
    'Auction App': AuctionApp(),
    'Banking App': BankingApp(),
    'Weather App': WeatherApp(),
    'Trip App': TripApp(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Challenges')),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(pages.keys.elementAt(i)),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => pages.values.elementAt(i)),
            ),
            trailing: Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}
