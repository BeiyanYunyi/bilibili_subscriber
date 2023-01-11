import 'dart:developer';

import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/models/db/video.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class DbService extends GetxService {
  late final Isar isar;
  Future<DbService> init() async {
    isar = await Isar.open([UperSchema, VideoSchema]);
    log('Isar inited.', name: 'DbService');
    return this;
  }
}
