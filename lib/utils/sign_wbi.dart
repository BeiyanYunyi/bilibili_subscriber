import 'dart:convert';

import 'package:crypto/crypto.dart';

const mixinKeyEncTab = [
  46,
  47,
  18,
  2,
  53,
  8,
  23,
  32,
  15,
  50,
  10,
  31,
  58,
  3,
  45,
  35,
  27,
  43,
  5,
  49,
  33,
  9,
  42,
  19,
  29,
  28,
  14,
  39,
  12,
  38,
  41,
  13,
  37,
  48,
  7,
  16,
  24,
  55,
  40,
  61,
  26,
  17,
  0,
  1,
  60,
  51,
  30,
  4,
  22,
  25,
  54,
  21,
  56,
  59,
  6,
  63,
  57,
  62,
  11,
  36,
  20,
  34,
  44,
  52
];

String getMixinKey({required String imgKey, required String subKey}) {
  final orig = imgKey + subKey;
  var temp = "";
  for (var n in mixinKeyEncTab) {
    if (temp.length < 32) {
      temp += orig[n];
    }
  }
  return temp;
}

String getSortedQuery(Map<String, dynamic> query, {int? orderedTime}) {
  final sortedKeys = query.keys.toList()..sort();
  var temp = "";
  for (var key in sortedKeys) {
    temp += "$key=${query[key]}&";
  }
  var time = orderedTime;
  if (time == null) {
    final date = DateTime.now();
    time = (date.millisecondsSinceEpoch / 1000).floor();
  }
  temp += "wts=$time";
  return temp;
}

String signWbi(
    {required Map<String, dynamic> query,
    required String imgKey,
    required String subKey,
    // Just for testing use
    int? orderedTime}) {
  final mixinKey = getMixinKey(imgKey: imgKey, subKey: subKey);
  final sortedQuery = getSortedQuery(query, orderedTime: orderedTime);
  final sign = md5.convert(utf8.encode(sortedQuery + mixinKey)).toString();
  return "$sortedQuery&w_rid=$sign";
}
