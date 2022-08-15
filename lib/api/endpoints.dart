import 'package:sos/util/app_config.dart';

class Endpoints {
  static final logReg = "${AppConfig.instance?.baseURL}access/logreg";
  static final user = "${AppConfig.instance?.baseURL}user";
}