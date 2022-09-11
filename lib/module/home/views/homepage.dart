import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/module/home/controllers/homepage_controller.dart';
import 'package:sos/util/colours.dart';
import 'package:sos/util/route_name.dart';
import 'package:sos/widget/promo_section.dart';

class Homepage extends StatelessWidget {
  final _controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, viewportConstraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: _searchSubmenu,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _promoSlider,
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
        ),
      );
    });
  }

  get _promoSlider {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      alignment: Alignment.topCenter,
      child: Obx(
        () => CarouselSlider(
          items: _controller.listBanner.map((data) {
            return Builder(
              builder: (context) {
                return SizedBox(
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl: data.image,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),),
                );
              },
            );
          }).toList(), options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          )),
      ),
    );
  }

  get _searchSubmenu {
    return TextFormField(
      readOnly: true,
      onTap: () => Get.toNamed(RouteName.searchJasaPage),
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
    );
  }
}
