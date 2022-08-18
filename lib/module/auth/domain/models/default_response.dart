class DefaultResponse {
  bool status;
  String message;
  dynamic result;

  DefaultResponse({
    required this.status,
    required this.message,
    this.result
  });

  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return DefaultResponse(
      status: json['status'], 
      message: json['message'],
      result: json['result']);
  }
}
