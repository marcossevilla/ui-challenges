import 'package:flutter/material.dart';

class ModernDrawer extends StatelessWidget {
  const ModernDrawer({Key key, this.isDark = false}) : super(key: key);

  final isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 30.0,
          height: 2.0,
          color: isDark ? Colors.black : Colors.white,
        ),
        SizedBox(height: 5.0),
        Container(
          width: 20.0,
          height: 2.0,
          color: isDark ? Colors.black : Colors.white,
        ),
      ],
    );
  }
}
