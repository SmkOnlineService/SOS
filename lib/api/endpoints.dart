import 'package:sos/util/app_config.dart';

class Endpoints {
  static final logReg = "${AppConfig.instance?.baseURL}access/logreg";
  static final user = "${AppConfig.instance?.baseURL}user";
  static final banner = "https://private-f85a9-smkonlineservice.apiary-mock.com/banner";
}