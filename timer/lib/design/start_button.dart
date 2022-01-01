import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({Key? key, required this.isRunning, this.onPressed})
      : super(key: key);
  final bool isRunning;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: isRunning ? Colors.red : Colors.green, // button color
        child: InkResponse(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              isRunning ? 'Dur' : 'Başla',
            ),
          ),
        ),
      ),
    );
  }
}
