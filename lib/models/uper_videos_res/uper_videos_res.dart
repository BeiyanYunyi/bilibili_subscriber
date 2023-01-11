import 'dart:convert';

import 'data.dart';

class UperVideosRes {
  String? className;
  int code;
  String message;
  int ttl;
  Data? data;

  UperVideosRes({
    this.className,
    required this.code,
    required this.message,
    required this.ttl,
    this.data,
  });

  @override
  String toString() {
    return 'UperVideosRes(className: $className, code: $code, message: $message, ttl: $ttl, data: $data)';
  }

  factory UperVideosRes.fromMap(Map<String, dynamic> data) => UperVideosRes(
        className: data['__className'] as String?,
        code: data['code'] as int,
        message: data['message'] as String,
        ttl: data['ttl'] as int,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        '__className': className,
        'code': code,
        'message': message,
        'ttl': ttl,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UperVideosRes].
  factory UperVideosRes.fromJson(String data) {
    return UperVideosRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UperVideosRes] to a JSON string.
  String toJson() => json.encode(toMap());
}
