import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayananTile extends StatelessWidget {
  // data yang dinamis yang akan dijadikan parameter
  // 1. gambar
  // 2. harga
  // 3. data layanan
  // 4. 1 variable OBX di setiap page controller yang isinya total harga di page tersebut
  //  - (harga layanan * jumlah layanan) + total sementara

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              "assets/images/ayam.jpg",
              height: 70.0,
              width: 70.0,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ganti Oli sintetis",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14)), //judul layanan
                SizedBox(height: 10,),
                Text(
                    "Oli sintetis dipergunakan untuk mesin mobil baru, mobil performa tinggi, dan mobil LCGC",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12)), //deskripsi layanan
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rp 240.000",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                    _itemCounter()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 35,
          width: 35,
          child: Icon(Icons.add, size: 20.0, color: Colors.amber,),
        ),
        const SizedBox(width: 8,),
        Text("10"),
        const SizedBox(width: 8,),
        Container(
          height: 35,
          width: 35,
          child: Icon(Icons.remove, size: 20.0, color: Colors.amber,),
        ),
      ],
    );
  }
}
