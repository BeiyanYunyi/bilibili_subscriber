import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/utils/fast_hash.dart';
import 'package:isar/isar.dart';

part 'video.g.dart';

@collection
class Video {
  late String bvId;
  Id get isarId => fastHash(bvId);
  DateTime publishTime = DateTime.now();
  String title = "";
  String desc = "";
  String cover = "";
  @Backlink(to: 'videos')
  final uper = IsarLink<Uper>();
}
