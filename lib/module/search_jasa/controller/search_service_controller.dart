import 'package:get/get.dart';
import 'package:sos/module/search_jasa/domain/models/jasa.dart';
import 'package:sos/module/search_jasa/domain/services/search_repository.dart';

class SearchServiceController extends GetxController {
  final SearchRepository _repository = SearchRepository();

  RxString userInput = "".obs;

  List<Jasa> listAllJasa = <Jasa>[].obs;
  List<Jasa> listJasa = <Jasa>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllJasa();
  }

  getAllJasa() {
    _repository
        .getAllJasa()
        .forEach((element) => listAllJasa.add(Jasa.fromJson(element)));
  }

  searchJasa(String keyword) {
    listJasa.clear();
    listJasa.addAll(
      listAllJasa.where((element) => element.namaJasa.toLowerCase().contains(keyword.toLowerCase()))
    );
  }
}
