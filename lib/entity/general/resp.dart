class Resp {
  final int code;
  final String message;
  final dynamic data;

  Resp({
    required this.code,
    required this.message,
    this.data,
  });

  factory Resp.fromJson(Map<String, dynamic> json) {
    return Resp(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}