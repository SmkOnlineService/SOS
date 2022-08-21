import 'package:sos/module/home/domain/models/banner_response.dart';

abstract class HomeRepositoryImpl {
  Future<BannerResponse> getBanner();
}