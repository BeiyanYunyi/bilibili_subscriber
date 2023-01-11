import 'data.dart';

class UperInfoRes {
  int code;
  String message;
  int ttl;
  Data? data;

  UperInfoRes({
    required this.code,
    required this.message,
    required this.ttl,
    this.data,
  });

  factory UperInfoRes.fromJson(Map<String, dynamic> json) => UperInfoRes(
        code: json['code'] as int,
        message: json['message'] as String,
        ttl: json['ttl'] as int,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'ttl': ttl,
        'data': data?.toJson(),
      };
}
