import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../api/get_uper_info.dart';
import '../../controllers/bilibili.dart';
import '../../controllers/db.dart';
import '../uper_info_res/card.dart';
import 'video.dart';

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

  @Index()
  DateTime createTime = DateTime.now();

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
    final videos =
        vlists.map((e) => Video.fromVlist(vlist: e, uperId: id)).toList();

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
          .uperIdEqualToPublishTimeLessThan(id, lastSeen,include: true)
          .deleteAll();
    });
    return count;
  }

  Future<void> update() async {
    final res = await getUperInfo(mid: id);
    if (res.data?.card == null) return;
    final card = res.data!.card!;
    face = card.face;
    sign = card.sign;
    name = card.name;
    final db = Get.find<DbService>();
    await db.isar.writeTxn(() async {
      await db.isar.upers.put(this);
    });
    await updateVideos();
    await trimVideos();
  }

  Future<void> delete() async {
    final db = Get.find<DbService>();
    await db.isar.writeTxn(() async {
      await db.isar.upers.delete(id);
    });
  }

  /// 表示已阅该 up 主当前的所有视频
  Future<void> see() async {
    final db = Get.find<DbService>();
    // 若数据库中已有视频，则设为库中最新视频的发布时间，否则设为现在
    lastSeen = (await db.isar.videos
            .where()
            .uperIdEqualToAnyPublishTime(id)
            .sortByPublishTimeDesc()
            .publishTimeProperty()
            .findFirst()) ??
        DateTime.now();
    await db.isar.writeTxn(() async {
      await db.isar.upers.put(this);
    });
    await update();
  }
}