import 'package:bilibili_subscriber/api/get_uper_videos.dart';

import '../models/uper_videos_res/vlist.dart';

Future<List<Vlist>> getVideos(
    {required int mid, required int pn, int ps = 25}) async {
  final res = await getUperVideos(mid: mid, pn: pn, ps: ps);
  if (res.data == null) throw Exception("data is null");
  if (res.data!.list == null) throw Exception("list is null");
  return res.data!.list!.vlist;
}

Future<List<Vlist>> getVideosAfter(
    {required int mid, required DateTime after}) async {
  List<Vlist> videos = [];
  int pn = 1;
  bool hasMore = true;
  while (hasMore) {
    final res = await getVideos(mid: mid, pn: pn);
    if (res.isEmpty) break;
    for (var element in res) {
      if (element.created! * 1000 > after.microsecondsSinceEpoch) {
        videos.add(element);
      } else {
        hasMore = false;
        break;
      }
    }
    pn += 1;
  }
  return videos;
}
