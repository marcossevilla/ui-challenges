import 'package:flutter/widgets.dart';


// * this is the child of the draggable bottom sheet

class Sheet extends StatelessWidget {
  const Sheet({
    Key key,
    @required this.color,
    @required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: this.color,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: this.child,
    );
  }
}
