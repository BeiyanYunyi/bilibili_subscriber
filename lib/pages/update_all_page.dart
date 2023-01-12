import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../components/uper_card.dart';
import '../controllers/db.dart';
import '../models/db/uper.dart';

class UpdateAllPage extends StatelessWidget {
  const UpdateAllPage({super.key});
  @override
  build(context) {
    final progress = 0.0.obs;
    final DbService db = Get.find();
    final upersUpdating = db.isar.upers.where().findAllSync().obs;
    final total = upersUpdating.length;
    Uper.updateAll().then((stream) => {
          stream.listen((event) {
            upersUpdating.removeAt(0);
            progress.value = (total - upersUpdating.length) / total;
          }).onDone(() {
            Get.back();
          })
        });

    return Scaffold(
      appBar: AppBar(
        title: const Text("更新所有UP主"),
      ),
      body: Obx(
        () => ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 8),
              child: Center(
                child: CircularProgressIndicator(
                  value: progress.value,
                ),
              ),
            ),
            ...upersUpdating.map(
              (uper) => Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                child: Card(
                  child: UperCardDisplay(
                    name: uper.name,
                    sign: uper.sign,
                    mid: uper.id,
                    face: uper.face,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
