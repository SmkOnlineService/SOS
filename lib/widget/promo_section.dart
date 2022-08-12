import 'package:flutter/cupertino.dart';
import 'package:sos/widget/promo_tile.dart';

class PromoSection extends StatelessWidget {
  final String sectionTitle;

  const PromoSection(this.sectionTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(sectionTitle),
          SizedBox(
            height: 250,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.55, 
                mainAxisSpacing: 5.0), 
              itemCount: 6,
              itemBuilder: (_, index) {
                return PromoTile("assets/images/ayam.jpg", "Promo $index", "October 21");
              }),
          )
        ],
      ),
    );
  }
}