import 'package:flutter/widgets.dart';

class ModernAppBar extends StatelessWidget {
  const ModernAppBar({
    Key key,
    this.leftChildren,
    this.rightChildren,
  }) : super(key: key);

  final List<Widget> leftChildren;
  final List<Widget> rightChildren;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: leftChildren ?? [],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rightChildren ?? [],
            )
          ],
        ),
      ),
    );
  }
}
