import 'package:flutter/material.dart';

class TripsDetail extends StatelessWidget {
  const TripsDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 6,
          child: Icon(
            Icons.beach_access,
            color: Colors.green,
            size: 40,
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Beach sunset',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '5.0 ratings',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
