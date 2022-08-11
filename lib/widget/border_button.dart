import 'package:flutter/material.dart';
import 'package:sos/util/colours.dart';


class BorderButton extends StatelessWidget {
  final String text;
  double size;
  Color colour;
  final VoidCallback onPress;

  BorderButton(this.text, this.onPress,
      {this.size = double.infinity, this.colour = Colours.border, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: TextButton(
          onPressed: onPress,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: colour)))),
          child: Text(text,
              style: TextStyle(
                  color: colour, fontWeight: FontWeight.w700))),
    );
  }
}