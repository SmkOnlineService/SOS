import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/module/mechanic_service/controller/servis_mobil_controller.dart';
import 'package:sos/module/mechanic_service/util/car_brand.dart';
import 'package:sos/util/colours.dart';
import 'package:sos/util/utility.dart';
import 'package:sos/widget/filled_button.dart';
import 'package:sos/widget/layanan_tile.dart';

class ServisMobilPage extends GetView<ServisMobilController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD9D9D9),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
                child: Text(
                  "Servis Mobil",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              _carBrandField(),
              _yearCarField(),
              _carTypeField(),
              _layananGantiOli(),
              _optionalCarAcProblemField(),
              _optionalCarMirrorProblemField(),
              _serviceDateField(context),
              _serviceTimeField(context),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 120,
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8,),
              const Text("Estimasi Harga"),
              Text("Rp. 2.983.000", style: TextStyle(fontSize: 18)),
              const SizedBox(
                height: 16,
              ),
              FilledButton("Selanjutnya", () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _serviceDateField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Kapan Anda membutuhkan layanan"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextFormField(
              readOnly: true,
              controller: controller.serviceDateTextController,
              onTap: () => controller.selectDate(
                  context, controller.serviceDateTextController),
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  hintText: "Isi tanggal layanan"),
            ),
          )
        ],
      ),
    );
  }

  Widget _serviceTimeField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Jam berapa layanan di butuhkan"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextFormField(
              readOnly: true,
              controller: controller.serviceTimeTextController,
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Utility.showTimeDialog(
                      controller.serviceTimeTextController)),
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  hintText: "Isi tanggal layanan"),
            ),
          )
        ],
      ),
    );
  }

  Widget _carBrandField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Apa Brand Mobil anda ?"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Column(
              children: [
                Obx(
                  () => RadioListTile(
                    title: const Text("Toyota"),
                    value: CarBrand.toyota, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    title: const Text("Honda"),
                    value: CarBrand.honda, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    title: const Text("Daihatsu"),
                    value: CarBrand.daihatsu, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    title: const Text("Suzuki"),
                    value: CarBrand.suzuki, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    title: const Text("Mitsubishi"),
                    value: CarBrand.mitsubishi, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    title: const Text("Nissan"),
                    value: CarBrand.nissan, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    title: const Text("Wuling"),
                    value: CarBrand.wuling, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    title: const Text("Lainnya"),
                    value: CarBrand.lainnya, 
                          groupValue: controller.selectedCarBrand.value,
                          onChanged: (value) {
                            CarBrand result = value as CarBrand;
                            controller.selectedCarBrand.value = result;
                          }
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _yearCarField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Tahun Mobil anda"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.yearCarTextController,
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),),
            ),
          )
        ],
      ),
    );
  }

  Widget _carTypeField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Apa Model Mobil anda"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextFormField(
              controller: controller.carModelTextController,
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colours.border, width: 1.0),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.blue),
            child: const Text("Contoh: Toyota Avanza, Mitsubishi Pajero Sport, Honda Jazz, dll", textAlign: TextAlign.center,))
        ],
      ),
    );
  }

  Widget _optionalCarAcProblemField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Apakah AC Mobil anda bermasalah ? (opsional)"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Column(
              children: [
                Obx(
                  () => CheckboxListTile(
                    title: const Text("AC Tidak Dingin"), 
                    value: controller.airConditionerTidakDingin.value,
                    onChanged: (bool? result) {  
                      if (result != null) {
                        controller.airConditionerTidakDingin.value = result;
                      }
                    },               
                  ),
                ),
                Obx(
                  () => CheckboxListTile(
                    title: const Text("AC Mengeluarkan Bau"), 
                    value: controller.airConditionerBau.value,
                    onChanged: (bool? result) {  
                      if (result != null) {
                        controller.airConditionerBau.value = result;
                      }
                    },               
                  ),
                ),
                Obx(
                  () => CheckboxListTile(
                    title: const Text("AC Berbunyi"), 
                    value: controller.airConditionerBerbunyi.value,
                    onChanged: (bool? result) {  
                      if (result != null) {
                        controller.airConditionerBerbunyi.value = result;
                      }
                    },               
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _optionalCarMirrorProblemField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Layanan Ganti Kaca Mobil (opsional)"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Column(
              children: [
                Obx(
                  () => CheckboxListTile(
                    title: const Text("Ganti Kaca"), 
                    value: controller.gantiKaca.value,
                    onChanged: (bool? value) {  
                      if (value != null) {
                        controller.gantiKaca.value = value;
                      }
                    },               
                  ),
                ),
                Obx(
                  () => CheckboxListTile(
                    title: const Text("Ganti Spion"), 
                    value: controller.gantiSpion.value,
                    onChanged: (bool? value) {  
                      if (value != null) {
                        controller.gantiSpion.value = value;
                      }
                    },               
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _layananGantiOli() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 1))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Layanan Ganti Oli (Shell 4 liter)"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Expanded(
              child: ListView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (ctx, index) {
                return LayananTile();
              }),
            )
          ),
          const Divider(
            color: Colors.black,
          ),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () {
                Utility.showServiceDialog( 
                  "* Jika harga jasa service kurang dari Rp100.000,- maka akan dikenakan biaya minimum transaksi sebesar Rp100.000,- \n \n ** Tidak dikenakan biaya apabila menggunakan jasa lainnya. Biaya ini dikenakan apabila tidak jadi menggunakan jasa Servis Mobil lain di atas.");
              },
              child: const Text("lihat info selengkapnya", textAlign: TextAlign.center)),
          ),
          const SizedBox(height: 8,)
        ],
      ),
    ); 
  }
}
