import 'dart:convert';

import 'package:bilibili_subscriber/consts/user_agent.dart';
import 'package:bilibili_subscriber/controllers/wbi_key.dart';
import 'package:bilibili_subscriber/models/uper_info_res/uper_info_res.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<UperInfoRes> getUperInfo({required int mid}) async {
  final WbiKeyService wbiKeyService = Get.find();
  final query = {"mid": mid};
  final sign = wbiKeyService.signQuery(query);
  var res = await http.get(
      Uri.parse("https://api.bilibili.com/x/web-interface/card?$sign"),
      headers: {"Accept": "application/json", "User-Agent": userAgent});
  var resJson = json.decode(res.body);
  return UperInfoRes.fromJson(resJson);
}
