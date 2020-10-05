import 'package:flutter/material.dart';

class TripInfo extends StatelessWidget {
  const TripInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _InfoColumn(
          title: 'Duration',
          content: '4 Days',
        ),
        _InfoColumn(
          title: 'Participants',
          content: '50 People',
        ),
        _InfoColumn(
          title: 'Destination',
          content: 'Hawai',
        ),
      ],
    );
  }
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
