import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/utils/fast_hash.dart';
import 'package:isar/isar.dart';

import '../uper_videos_res/vlist.dart';

part 'video.g.dart';

@collection
class Video {
  late String bvId;

  Id get isarId => fastHash(bvId);

  @Index()
  DateTime publishTime = DateTime.now();

  String title = "";

  String desc = "";

  String cover = "";

  @Backlink(to: 'videos')
  final uper = IsarLink<Uper>();

  Video(
      {required this.bvId,
      required this.publishTime,
      required this.title,
      required this.desc,
      required this.cover});

  factory Video.fromVlist(Vlist vlist) => Video(
      bvId: vlist.bvid!,
      publishTime: DateTime.fromMillisecondsSinceEpoch(vlist.created! * 1000),
      title: vlist.title!,
      desc: vlist.description!,
      cover: vlist.pic!);
}
