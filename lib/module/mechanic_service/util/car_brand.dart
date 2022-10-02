import 'package:flutter/foundation.dart';

enum CarBrand {
  toyota,
  honda,
  daihatsu,
  suzuki,
  mitsubishi,
  nissan,
  wuling,
  lainnya
}

extension CarBrandExtension on CarBrand {
  String get carBrand => describeEnum(this);

  String getCarBrand(CarBrand brand) {
    switch (this) {
      case CarBrand.toyota:
        return "Toyota";
      case CarBrand.honda:
        return "Honda";
      case CarBrand.daihatsu:
        return "Daihatsu";
      case CarBrand.suzuki:
        return "Suzuki";
      case CarBrand.mitsubishi:
        return "Mitsubishi";
      case CarBrand.nissan:
        return "Nissan";
      case CarBrand.wuling:
        return "Wuling";
      case CarBrand.lainnya:
        return "Lainnya";
      default:
        return "unknown brand";
    }
  }
}