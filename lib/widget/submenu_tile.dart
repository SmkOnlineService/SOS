import 'package:flutter/material.dart';
import 'package:sos/util/colours.dart';

class SubmenuTile extends StatelessWidget {
  final String menuTitle;

  const SubmenuTile(this.menuTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 10,
      width: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 15.0),
            child: Icon(
              Icons.check_circle,
              color: Colours.primaryColor,
              size: 30,
            ),
          ),
          Text(menuTitle)
        ],
      ),
    );
  }
}
