import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_challenges/src/shared/widgets/box_shadow.dart';

class RadialProgressBar extends StatefulWidget {
  final bool elevated;
  final bool showPercentage;
  final Color backgroundColor;
  final Color valueColor;
  final double percentage;
  final double valueStrokeWidth;
  final double backgroundStrokeWidth;
  final TextStyle percentageStyle;
  final Duration duration;

  RadialProgressBar({
    @required this.percentage,
    this.duration = const Duration(milliseconds: 500),
    this.elevated = false,
    this.valueColor,
    this.showPercentage = false,
    this.percentageStyle,
    this.backgroundColor,
    this.valueStrokeWidth = 10,
    this.backgroundStrokeWidth = 5,
  });

  @override
  _RadialProgressBarState createState() => _RadialProgressBarState();
}

class _RadialProgressBarState extends State<RadialProgressBar>
    with SingleTickerProviderStateMixin {
  double oldPercentage;
  AnimationController _controller;

  // animating percentage with TweenAnimationBuilder
  double tweenPercentage;

  @override
  void initState() {
    oldPercentage = widget.percentage;
    _controller = AnimationController(vsync: this, duration: widget.duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);

    final animationDiff = widget.percentage - oldPercentage;
    tweenPercentage = oldPercentage;
    oldPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              child: widget.showPercentage
                  ? TweenAnimationBuilder<double>(
                      builder: (_, value, __) {
                        return Container(
                          child: Text(
                            value.toStringAsFixed(0),
                            style: widget.percentageStyle == null
                                ? Theme.of(context).textTheme.headline4
                                : widget.percentageStyle,
                          ),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: widget.elevated ? [cardShadow()] : [],
                          ),
                        );
                      },
                      duration: widget.duration,
                      tween: Tween<double>(
                        begin: tweenPercentage,
                        end: widget.percentage,
                      ),
                    )
                  : null,
            ),
            painter: _RadialPainter(
              (widget.percentage - animationDiff) +
                  (animationDiff * _controller.value),
              widget.valueColor == null
                  ? Theme.of(context).primaryColor
                  : widget.valueColor,
              widget.backgroundColor == null
                  ? Colors.grey
                  : widget.backgroundColor,
              widget.valueStrokeWidth,
              widget.backgroundStrokeWidth,
            ),
          ),
        );
      },
    );
  }
}

class _RadialPainter extends CustomPainter {
  final Color valueColor;
  final Color backgroundColor;

  final double percentage;
  final double valueStrokeWidth;
  final double backgroundStrokeWidth;

  _RadialPainter(
    this.percentage,
    this.valueColor,
    this.backgroundColor,
    this.valueStrokeWidth,
    this.backgroundStrokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = backgroundStrokeWidth
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radius = math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // progress arc
    final Paint arcPaint = Paint()
      ..strokeWidth = valueStrokeWidth
      ..color = valueColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double arcAngle = 2 * math.pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      arcAngle,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(_RadialPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_RadialPainter oldDelegate) => false;
}
