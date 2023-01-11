import 'dart:convert';

import 'package:bilibili_subscriber/consts/user_agent.dart';
import 'package:bilibili_subscriber/models/uper_info_res/uper_info_res.dart';
import 'package:http/http.dart' as http;

Future<UperInfoRes> getUperInfo({required int mid}) async {
  var res = await http.get(
      Uri.parse("https://api.bilibili.com/x/web-interface/card?mid=$mid"),
      headers: {"Accept": "application/json", "User-Agent": userAgent});
  var resJson = json.decode(res.body);
  return UperInfoRes.fromJson(resJson);
}
