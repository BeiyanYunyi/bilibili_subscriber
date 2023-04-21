import 'dart:developer';

import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/models/db/video.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DbService extends GetxService {
  late final Isar isar;
  Future<DbService> init() async {
    final dir = await getApplicationDocumentsDirectory();
    // final dataDir = Directory('data').absolute.path;
    isar = await Isar.open([UperSchema, VideoSchema], directory: dir.path);
    log('Isar inited.', name: 'DbService');
    return this;
  }
}
