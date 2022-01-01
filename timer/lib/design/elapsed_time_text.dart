import 'package:flutter/material.dart';

class ElapsedTimeText extends StatelessWidget {
  const ElapsedTimeText({Key? key, required this.elapsed}) : super(key: key);
  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    final hundred = (elapsed.inMilliseconds / 10) % 100;
    final second = elapsed.inSeconds % 60;
    final minute = elapsed.inMinutes % 60;
    final hundredStr = hundred.toStringAsFixed(0).padLeft(2, '0');
    final secondStr = second.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    const dotWidth = 12.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeDot(minuteStr.substring(0, 1), width: dotWidth),
        TimeDot(minuteStr.substring(1, 2), width: dotWidth),
        TimeDot(':', width: 7),
        TimeDot(secondStr.substring(0, 1), width: dotWidth),
        TimeDot(secondStr.substring(1, 2), width: dotWidth),
        TimeDot(':', width: 7),
        TimeDot(hundredStr.substring(0, 1), width: dotWidth),
        TimeDot(hundredStr.substring(1, 2), width: dotWidth),
      ],
    );
  }
}

class TimeDot extends StatelessWidget {
  const TimeDot(this.text, {Key? key, required this.width}) : super(key: key);
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white60),
        textAlign: TextAlign.center,
      ),
    );
  }
}
