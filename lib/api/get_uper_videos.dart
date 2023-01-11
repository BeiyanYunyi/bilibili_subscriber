import 'dart:developer';

import 'package:bilibili_subscriber/consts/user_agent.dart';
import 'package:bilibili_subscriber/models/uper_videos_res/data.dart';
import 'package:bilibili_subscriber/models/uper_videos_res/list.dart';
import 'package:bilibili_subscriber/models/uper_videos_res/uper_videos_res.dart';
import 'package:http/http.dart' as http;

Future<UperVideosRes> getUperVideos(
    {required int mid, required int pn, int ps = 25}) async {
  var res = await http.get(
      Uri.parse(
          "https://api.bilibili.com/x/space/wbi/arc/search?mid=$mid&pn=$pn&ps=$ps&index=1&order=pubdate"),
      headers: {"Accept": "application/json", "User-Agent": userAgent});
  final data = UperVideosRes.fromJson(res.body);
  if (data.code == -404) {
    return UperVideosRes(
        code: -404,
        message: 'no videos',
        ttl: 0,
        data: Data(list: BList(vlist: [])));
  }
  if (data.code != 0) {
    log(res.body, name: "getUperVideos");
    throw Exception("code is not 0");
  }
  return data;
}
