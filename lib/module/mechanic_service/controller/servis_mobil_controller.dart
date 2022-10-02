import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sos/module/mechanic_service/util/car_brand.dart';

class ServisMobilController extends GetxController {
  final serviceDateTextController = TextEditingController();
  final serviceTimeTextController = TextEditingController();
  final yearCarTextController = TextEditingController();
  final carModelTextController = TextEditingController();

  RxBool airConditionerTidakDingin = false.obs;
  RxBool airConditionerBau = false.obs;
  RxBool airConditionerBerbunyi = false.obs;
  
  RxBool gantiKaca = false.obs;
  RxBool gantiSpion = false.obs;

  DateTime selectedDate = DateTime.now();

  Rx<CarBrand> selectedCarBrand = CarBrand.toyota.obs;

  Future<void> selectDate(BuildContext context, TextEditingController dateTextController) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(1900, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) selectedDate = picked;
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    dateTextController.text = formattedDate;
  }
}