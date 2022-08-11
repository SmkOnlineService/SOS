import 'package:flutter/material.dart';
import 'package:sos/util/colours.dart';

class FilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const FilledButton(this.title, this.onPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 10)),
            backgroundColor: MaterialStateProperty.all<Color>(Colours.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
        ),
        child: Text(title),
      ),
    );
  }
}