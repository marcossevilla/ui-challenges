import 'package:flutter/material.dart';

import 'detail.dart';
import '../widgets/trips_info.dart';
import '../widgets/trips_detail.dart';

class TripApp extends StatelessWidget {
  static const String route = 'tripApp';

  static Route go() => MaterialPageRoute<void>(builder: (_) => TripApp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/trip_app/sunset_portrait.jpg',
              fit: BoxFit.cover,
            ),
          ),
          _AppBar(),
          Positioned(
            bottom: 0,
            child: _BottomCards(),
          ),
        ],
      ),
    );
  }
}

class _BottomCards extends StatelessWidget {
  const _BottomCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            _PaddedCard(
              child: Row(
                children: [
                  TripsDetail(),
                  Spacer(),
                  Column(
                    children: [
                      Text('\$225',
                          style: Theme.of(context).textTheme.headline6),
                      Text(
                        'per person',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  )
                ],
              ),
            ),
            _PaddedCard(
              child: Column(
                children: [
                  TripInfo(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.grey.shade200,
                        child: Icon(Icons.bookmark_border),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: FlatButton.icon(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          color: Colors.amber,
                          onPressed: () => Navigator.of(context).push(
                            DetailScreen.go(),
                          ),
                          icon: Icon(Icons.chevron_right),
                          label: Text('More information'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaddedCard extends StatelessWidget {
  const _PaddedCard({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          child: child),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text('Discover'),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
