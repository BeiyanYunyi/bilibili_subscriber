import 'package:bilibili_subscriber/models/db/video.dart';
import 'package:isar/isar.dart';

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
}
