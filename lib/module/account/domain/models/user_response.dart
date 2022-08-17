class UserResponse {
  bool status;
  String message;
  List<UserData>? result;

  UserResponse({required this.status, required this.message, this.result});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    var list = json['result'] != null ? json['result'] as List : List.empty();
    List<UserData> userData = list.map((i) => UserData.fromJson(i)).toList();

    return UserResponse(
        status: json['status'],
        message: json['message'],
        result: list.isEmpty ? null : userData);
  }
}

class UserData {
  String idUser;
  String name;
  String? fullname;
  String email;
  String photo;
  String? phone;
  String token;
  String created;
  String updated;

  UserData(
      {required this.idUser,
      required this.name,
      this.fullname,
      required this.email,
      required this.photo,
      this.phone,
      required this.token,
      required this.created,
      required this.updated});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        idUser: json['id_user'],
        name: json['name'],
        fullname: json['fullname'],
        email: json['email'],
        photo: json['photo'],
        phone: json['phone'],
        token: json['token'],
        created: json['created'],
        updated: json['updated']);
  }
}
