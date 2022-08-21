class BannerResponse {
  bool status;
  String message;
  List<Banner>? result;

  BannerResponse({required this.status, required this.message, this.result});

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    var list = json['result'] != null ? json['result'] as List : List.empty();
    List<Banner> bannerData = list.map((i) => Banner.fromJson(i)).toList();

    return BannerResponse(
        status: json['status'],
        message: json['message'],
        result: list.isEmpty ? null : bannerData);
  }
}

class Banner {
  String id;
  String image;

  Banner({required this.id, required this.image});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(id: json['id'], image: json['image']);
  }
}
