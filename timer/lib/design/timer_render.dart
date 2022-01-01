import 'dart:math';

import 'package:flutter/material.dart';

import 'clock_hand.dart';
import 'clock_maskers.dart';
import 'elapsed_time_text.dart';

class StopwatchRender extends StatelessWidget {
  final Duration elapsed;
  final double radius;
  const StopwatchRender({Key? key, required this.elapsed, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              top: radius,
              left: radius,
              child: ClockTestMarker(value: i, maxValue: 60, radius: radius)),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              handThickness: 2,
              handLenght: radius,
              color: Colors.white54),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
