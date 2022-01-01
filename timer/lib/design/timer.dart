import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:timer/design/reset_button.dart';
import 'package:timer/design/start_button.dart';
import 'package:timer/design/timer_render.dart';

class Timerr extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timerr> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;

  bool _isRunning = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ticker = this.createTicker((elapsed) {
      final now = DateTime.now();
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toogleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previouslyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        final radius = contraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRender(
              elapsed: _elapsed,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  onPressed: _toogleRunning,
                  isRunning: _isRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
