import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key key,
    @required this.backgroundColor,
    @required this.title,
    @required this.content,
    this.isPrimary = true,
  }) : super(key: key);

  final bool isPrimary;
  final String title;
  final String content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isPrimary
            ? BorderRadius.circular(20.0)
            : BorderRadius.horizontal(right: Radius.circular(20.0)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: isPrimary ? Colors.white : Colors.white70,
                ),
          ),
          SizedBox(height: 5.0),
          Text(
            content,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: isPrimary ? Colors.white : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
