import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/module/search_jasa/controller/search_service_controller.dart';
import 'package:sos/module/search_jasa/domain/models/jasa.dart';
import 'package:sos/util/colours.dart';

class SearchServicePage extends GetView<SearchServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar(),
        body: Column(
          children: [
            Obx(() => controller.userInput.value == ""
                ? _buildListJasa(controller.listAllJasa)
                : Obx(() => controller.listJasa.isNotEmpty
                    ? _buildListJasa(controller.listJasa)
                    : const Text("Data yang anda cari tidak ada")))
          ],
        ));
  }

  AppBar _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: _searchSubmenu,
    );
  }

  Widget _buildListJasa(List<Jasa> list) {
    return Expanded(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index].namaJasa),
              );
            }));
  }

  get _searchSubmenu {
    return TextFormField(      
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
              color: Colours.border, fontWeight: FontWeight.w500, fontSize: 14),
          hintText: "Cari disini"),
      onChanged: (value) {
        controller.userInput.value = value;
        if (value.isNotEmpty) {
          controller.searchJasa(value);
        }
      },
    );
  }
}
