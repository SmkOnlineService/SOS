import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromoTile extends StatelessWidget {
  final String image;
  final String title;
  final String expiredDate;

  const PromoTile(this.image, this.title, this.expiredDate, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(image,
                  fit: BoxFit.cover, height: 170.0, width: 170.0)),
          const SizedBox(height: 10,),
          Text(title),
          const SizedBox(height: 10,),
          Text(expiredDate)
        ],
      ),
    );
  }
}
