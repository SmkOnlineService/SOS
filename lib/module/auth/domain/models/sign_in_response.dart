class SignInResponse {
  bool status;
  String message;
  UserId? result;

  SignInResponse({required this.status, required this.message, this.result});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
        status: json['status'],
        message: json['message'],
        result:
            json['result'] != null ? UserId.fromJson(json['result']) : null);
  }
}

class UserId {
  String idUser;

  UserId({required this.idUser});

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(idUser: json['id_user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    return data;
  }
}
