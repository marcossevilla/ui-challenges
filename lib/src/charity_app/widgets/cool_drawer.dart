import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;

  const CustomDrawer({Key key, @required this.child}) : super(key: key);

  static CustomDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<CustomDrawerState>();

  @override
  CustomDrawerState createState() => new CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  static const Duration toggleDuration = Duration(milliseconds: 250);
  static const double maxSlide = 225;
  // static const double minDragStartEdge = 60;
  // static const double maxDragStartEdge = maxSlide - 16;
  AnimationController _animationController;
  // bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: CustomDrawerState.toggleDuration,
    );
  }

  void close() => _animationController.reverse();

  void open() => _animationController.forward();

  void toggleDrawer() => _animationController.isCompleted ? close() : open();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_animationController.isCompleted) {
          close();
          return false;
        }
        return true;
      },
      // child: GestureDetector(
      // onHorizontalDragStart: _onDragStart,
      // onHorizontalDragUpdate: _onDragUpdate,
      // onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _animationController,
        child: widget.child,
        builder: (context, child) {
          double animValue = _animationController.value;
          final slideAmount = maxSlide * animValue;
          final contentScale = 1.0 - (0.3 * animValue);
          return Stack(
            children: <Widget>[
              MyDrawer(),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slideAmount)
                  ..scale(contentScale, contentScale),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: _animationController.isCompleted ? close : null,
                  child: child,
                ),
              ),
            ],
          );
        },
      ),
      // ),
    );
  }

  // void _onDragStart(DragStartDetails details) {
  //   bool isDragOpenFromLeft = _animationController.isDismissed &&
  //       details.globalPosition.dx < minDragStartEdge;
  //   bool isDragCloseFromRight = _animationController.isCompleted &&
  //       details.globalPosition.dx > maxDragStartEdge;

  //   _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  // }

  // void _onDragUpdate(DragUpdateDetails details) {
  //   if (_canBeDragged) {
  //     double delta = details.primaryDelta / maxSlide;
  //     _animationController.value += delta;
  //   }
  // }

  // void _onDragEnd(DragEndDetails details) {
  //   // I have no idea what it means, copied from Drawer
  //   double _kMinFlingVelocity = 365.0;

  //   if (_animationController.isDismissed || _animationController.isCompleted) {
  //     return;
  //   }
  //   if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
  //     double visualVelocity = details.velocity.pixelsPerSecond.dx /
  //         MediaQuery.of(context).size.width;

  //     _animationController.fling(velocity: visualVelocity);
  //   } else if (_animationController.value < 0.5) {
  //     close();
  //   } else {
  //     open();
  //   }
  // }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black87,
        child: SafeArea(
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const BackButton(),
                _UserData(),
                Spacer(),
                ListTile(
                  leading: Icon(FontAwesomeIcons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.search, color: Colors.grey),
                  title: Text(
                    'Search Project',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.bullseye, color: Colors.grey),
                  title: Text('Goals', style: TextStyle(color: Colors.grey)),
                ),
                ListTile(
                  leading:
                      Icon(FontAwesomeIcons.locationArrow, color: Colors.grey),
                  title: Text(
                    'The Table',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ListTile(
                  leading:
                      Icon(FontAwesomeIcons.peopleCarry, color: Colors.grey),
                  title: Text(
                    'Community',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt, color: Colors.red),
                  title: Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () => Navigator.of(context).pop(),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserData extends StatelessWidget {
  const _UserData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(FontAwesomeIcons.userAlt, color: Colors.black54),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Marcos Sevilla',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white),
              ),
              Text(
                'Donator',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
