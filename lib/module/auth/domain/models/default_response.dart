class DefaultResponse {
  bool status;
  String message;

  DefaultResponse({
    required this.status,
    required this.message,
  });

  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return DefaultResponse(status: json['status'], message: json['message']);
  }
}
