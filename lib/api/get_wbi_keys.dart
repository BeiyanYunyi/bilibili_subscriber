import 'dart:convert';

import 'package:http/http.dart' as http;

import '../consts/user_agent.dart';

class WbiKeys {
  final String imgKey;
  final String subKey;

  WbiKeys({required this.imgKey, required this.subKey});
}

String getKey(String url) {
  final pattern = RegExp(r'([a-fA-F\d]{32})');
  final match = pattern.firstMatch(url);
  if (match == null) {
    throw Exception("Cannot get key");
  }
  return match.group(0) as String;
}

Future<WbiKeys> getWbiKeys() async {
  final res = await http.get(
      Uri.parse("https://api.bilibili.com/x/web-interface/nav"),
      headers: {"Accept": "application/json", "User-Agent": userAgent});
  final body = json.decode(res.body) as Map<String, dynamic>;
  final imgUrl = body["data"]["wbi_img"]["img_url"] as String?;
  final subUrl = body["data"]["wbi_img"]["sub_url"] as String?;
  if (imgUrl == null || subUrl == null) {
    throw Exception("Cannot get wbi keys");
  }
  return WbiKeys(imgKey: getKey(imgUrl), subKey: getKey(subUrl));
}
