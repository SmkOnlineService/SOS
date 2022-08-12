import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/module/home/controllers/homepage_controller.dart';
import 'package:sos/util/colours.dart';
import 'package:sos/widget/promo_section.dart';
import 'package:sos/widget/submenu_tile.dart';

class Homepage extends StatelessWidget {
  final _controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _searchSubmenu,
              _horizontalGridSubmenu,
              ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return PromoSection("Promo 17 Agustus");
                  }),
            ],
          ),
        ),
      );
    });
  }

  get _searchSubmenu {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60),
      child: TextFormField(
        decoration: const InputDecoration(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(
                color: Colours.border,
                fontWeight: FontWeight.w500,
                fontSize: 14),
            hintText: "Cari disini"),
        onChanged: (value) {},
      ),
    );
  }

  get _horizontalGridSubmenu {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 10.0, 16.0, 8.0),
      width: double.infinity,
      height: 180,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 54,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          shrinkWrap: true,
          itemBuilder: (_, i) {
            return SubmenuTile("Elektro $i");
          }),
    );
  }
}
