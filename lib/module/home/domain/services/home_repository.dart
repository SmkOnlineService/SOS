import 'package:dio/dio.dart';
import 'package:sos/api/dio_instance.dart';
import 'package:sos/api/dio_service_exception.dart';
import 'package:sos/api/endpoints.dart';
import 'package:sos/main.dart';
import 'package:sos/module/home/domain/models/banner_response.dart';
import 'package:sos/module/home/domain/repository/home_repository_impl.dart';

class HomeRepository implements HomeRepositoryImpl {
  final _client = DioInstance().init();

  @override
  Future<BannerResponse> getBanner() async {
    try {
      final response = await _client.get(Endpoints.banner);

      runHttpInspector(response.data);
      return BannerResponse.fromJson(response.data);
    } on DioError catch(err) {
      throw await handleDioError(err);
    }
  }
}