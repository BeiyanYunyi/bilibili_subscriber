import 'package:bilibili_subscriber/controllers/db.dart';
import 'package:bilibili_subscriber/models/db/video.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../controllers/bilibili.dart';
import '../uper_info_res/card.dart';

part 'uper.g.dart';

@collection
class Uper {
  late Id id;

  /// 上次检查更新
  @Index()
  DateTime lastUpdate = DateTime.now();

  /// 上次观看视频
  @Index()
  DateTime lastSeen = DateTime.now();

  String sign = "";

  String name = "";

  String face = "";

  final videos = IsarLinks<Video>();

  Uper(
      {required this.id,
      required this.name,
      required this.face,
      required this.sign});

  factory Uper.fromCard(Card card) => Uper(
      id: int.parse(card.mid),
      name: card.name,
      sign: card.sign,
      face: card.face);

  Future<int> updateVideos() async {
    DbService db = Get.find();
    final vlists = await getVideosAfter(mid: id, after: lastSeen);
    final videos = vlists.map((e) => Video.fromVlist(e)).toList();

    await db.isar.writeTxn(() async {
      lastUpdate = DateTime.now();
      await db.isar.videos.putAll(videos);
      this.videos.addAll(videos);
      await this.videos.save();
      await db.isar.upers.put(this);
    });
    return videos.length;
  }

  Future<int> trimVideos() async {
    DbService db = Get.find();
    var count = 0;
    await db.isar.writeTxn(() async {
      count = await db.isar.videos
          .where()
          .publishTimeLessThan(lastSeen)
          .deleteAll();
    });
    return count;
  }
}
