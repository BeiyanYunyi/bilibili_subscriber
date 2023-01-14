import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../api/get_uper_info.dart';
import '../../controllers/bilibili.dart';
import '../../controllers/db.dart';
import '../uper_info_res/card.dart';
import 'video.dart';

part 'uper.g.dart';

class UperUpdateRes {
  final Uper uper;

  final int count;

  const UperUpdateRes({required this.uper, required this.count});
}

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

  /// 更新视频
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

  /// 删除发布时间在已阅时间之前的视频
  Future<int> trimVideos() async {
    DbService db = Get.find();
    var count = 0;
    await db.isar.writeTxn(() async {
      count = await db.isar.videos
          .where()
          .uperIdEqualToPublishTimeLessThan(id, lastSeen, include: true)
          .deleteAll();
    });
    return count;
  }

  /// 更新 UP 主，包括：
  /// 1. 更新 UP 主个人信息
  /// 2. 更新视频
  /// 3. 删除在已阅时间之前的视频
  Future<UperUpdateRes> update() async {
    final res = await getUperInfo(mid: id);
    if (res.data?.card == null) return UperUpdateRes(uper: this, count: 0);
    final card = res.data!.card!;
    face = card.face;
    sign = card.sign;
    name = card.name;
    final db = Get.find<DbService>();
    await db.isar.writeTxn(() async {
      await db.isar.upers.put(this);
    });
    final count = await updateVideos();
    await trimVideos();
    return UperUpdateRes(uper: this, count: count);
  }

  Future<void> delete() async {
    final db = Get.find<DbService>();
    await db.isar.writeTxn(() async {
      await db.isar.videos.where().uperIdEqualToAnyPublishTime(id).deleteAll();
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

  /// 更新所有 UP 主的视频
  static Future<Stream<UperUpdateRes>> updateAll() async {
    final db = Get.find<DbService>();
    final upers = await db.isar.upers.where().findAll();
    var i = 0;
    final List<Future<UperUpdateRes>> pms = [];
    for (final uper in upers) {
      final fu = Future.delayed(Duration(seconds: i)).then((e) {
        return uper.update();
      });
      pms.add(fu);
      i += 1;
    }
    return Stream.fromFutures(pms);
  }

  /// 将所有 UP 主标记为已阅
  static Future<void> seeAll() async {
    final db = Get.find<DbService>();
    final upers = await db.isar.upers.where().findAll();
    final pms = upers.map((uper) async {
      await uper.see();
    });
    await Future.wait(pms);
  }

  static Future<String> exportToJson() async {
    final db = Get.find<DbService>();
    final upers = await db.isar.upers.where().exportJsonRaw((bytes) {
      return GZipEncoder().encode(bytes, level: 9);
    });
    return base64UrlEncode(upers!);
  }

  static Future<void> importFromJson(String json) async {
    final db = Get.find<DbService>();
    final bytes = base64Decode(json);
    final uint8List =
        Uint8List.fromList(GZipDecoder().decodeBytes(bytes, verify: true));
    await db.isar.writeTxn(() async {
      await db.isar.upers.importJsonRaw(uint8List);
    });
  }
}
