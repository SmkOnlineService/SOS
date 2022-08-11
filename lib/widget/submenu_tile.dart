import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos/util/colours.dart';

class SubmenuTile extends StatelessWidget {
  final String menuTitle;

  const SubmenuTile(this.menuTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.check_circle,
          color: Colours.primaryColor,
        ),
        Text(menuTitle)
      ],
    );
  }
}
