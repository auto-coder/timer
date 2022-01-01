import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey, // button color
        child: InkResponse(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Sıfırla',
            ),
          ),
        ),
      ),
    );
  }
}
