import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import 'db.dart';

class UpersController extends GetxController {
  final upers = <Uper>[].obs;
  Future<void> load() async {
    DbService db = Get.find();
    upers.value = await db.isar.upers.where().sortByCreateTime().findAll();
  }
}
