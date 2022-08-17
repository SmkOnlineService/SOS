import 'package:flutter/material.dart';
import 'package:sos/util/colours.dart';

class FilledButton extends StatelessWidget {
  final String title;
  double size;
  Color colour;
  final VoidCallback onPress;

  FilledButton(this.title, this.onPress,
      {this.colour = Colours.primaryColor,
      this.size = double.infinity,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 10)),
          backgroundColor: MaterialStateProperty.all<Color>(colour),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
