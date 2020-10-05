import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../widgets/trips_info.dart';
import '../widgets/ticket_card.dart';
import '../widgets/trips_detail.dart';

const kLightGreen = Color(0xffCBDCD8);

class DetailScreen extends StatelessWidget {
  static const String route = 'detail';

  static Route go() => MaterialPageRoute<void>(builder: (_) => DetailScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        elevation: 0,
        title: Text('Details', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: kLightGreen,
      ),
      backgroundColor: kLightGreen,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TicketCard(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TripsDetail(),
                    SizedBox(height: 25),
                    TripInfo(),
                  ],
                ),
              ),
            ),
            TicketCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/trip_app/sunset_landscape.jpg',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price details',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: 10),
                        Text('${lorem(paragraphs: 1, words: 10)}'),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total price'),
                            Text(
                              '\$250.25',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: FlatButton.icon(
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.amber,
              onPressed: () {},
              icon: Icon(Icons.chevron_right),
              label: Text('Continue to payment'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
