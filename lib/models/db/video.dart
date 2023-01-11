import 'package:isar/isar.dart';

import '../../utils/fast_hash.dart';
import '../uper_videos_res/vlist.dart';
import 'uper.dart';

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

  @Index(composite: [CompositeIndex('publishTime')])
  late int uperId;

  @Backlink(to: 'videos')
  final uper = IsarLink<Uper>();

  Video(
      {required this.bvId,
      required this.publishTime,
      required this.title,
      required this.desc,
      required this.cover,
      required this.uperId});

  factory Video.fromVlist({required Vlist vlist, required int uperId}) => Video(
      bvId: vlist.bvid!,
      publishTime: DateTime.fromMillisecondsSinceEpoch(vlist.created! * 1000),
      title: vlist.title!,
      desc: vlist.description!,
      cover: vlist.pic!,
      uperId: uperId);
}
