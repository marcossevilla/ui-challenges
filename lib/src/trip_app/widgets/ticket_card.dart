import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Card(
        elevation: 0,
        child: child,
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 20;

    final path = Path();

    path.moveTo(radius, 0);

    path.arcToPoint(
      Offset(0, radius),
      radius: Radius.circular(radius),
    );

    path.lineTo(0, size.height - radius);

    path.arcToPoint(
      Offset(radius, size.height),
      radius: Radius.circular(radius),
    );

    path.lineTo(size.width - radius, size.height);

    path.arcToPoint(
      Offset(size.width, size.height - radius),
      radius: Radius.circular(radius),
    );

    path.lineTo(size.width, radius);

    path.arcToPoint(
      Offset(size.width - radius, 0),
      radius: Radius.circular(radius),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
