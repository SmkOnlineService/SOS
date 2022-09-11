class Jasa {
  String idJasa;
  String namaJasa;
  String created;
  String? updated;

  Jasa({
    required this.idJasa,
    required this.namaJasa,
    required this.created,
    this.updated
  });

  factory Jasa.fromJson(Map<String, dynamic> json) {
    return Jasa(
      idJasa: json['id_jasa'], 
      namaJasa: json['nama'], 
      created: json['created'],
      updated:  json['updated']);
  }
}