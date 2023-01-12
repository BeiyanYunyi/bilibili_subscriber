import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/get_uper_info.dart';
import '../api/get_uper_videos.dart';
import '../components/uper_card.dart';
import '../controllers/db.dart';
import '../models/db/uper.dart';
import '../models/uper_info_res/uper_info_res.dart';
import '../models/uper_videos_res/uper_videos_res.dart';
import '../utils/wait_concurrently.dart';

class AddUperController extends GetxController {
  final uperVideosRes = UperVideosRes(
    code: -404,
    message: 'no videos',
    ttl: 0,
  ).obs;

  final uperInfoRes = UperInfoRes(code: 0, message: "", ttl: 0).obs;

  bool get isOk {
    return uperInfoRes.value.data?.card != null &&
        uperVideosRes.value.data?.list?.vlist != null;
  }

  final inputUid = "".obs;

  final queryUid = "".obs;

  void init() {
    uperInfoRes.value = UperInfoRes(code: 0, message: "", ttl: 0);
    uperVideosRes.value = UperVideosRes(
      code: -404,
      message: 'no videos',
      ttl: 0,
    );
    queryUid.value = "";
  }

  Future<void> getUperInfoAndVideos({required int mid}) async {
    final uperInfoFuture = getUperInfo(mid: mid);
    final uperVideosFuture = getUperVideos(mid: mid, pn: 1);
    final result = await waitConcurrently(uperInfoFuture, uperVideosFuture);
    uperInfoRes.value = result.item1;
    uperVideosRes.value = result.item2;
    if (!isOk) {
      Get.snackbar("错误", "获取 UP 主信息失败");
    }
  }

  Future<void> subscribe() async {
    DbService dbService = Get.find();
    final uper = Uper.fromCard(uperInfoRes.value.data!.card!);
    await dbService.isar.writeTxn(() async {
      await dbService.isar.upers.put(uper);
    });
    await uper.updateVideos();
    Get.back();
    Get.snackbar("成功", "已成功添加 UP 主: ${uper.name}");
  }
}

class UperInfo extends StatelessWidget {
  const UperInfo({super.key, required this.mid});

  final int mid;

  @override
  Widget build(BuildContext context) {
    AddUperController c = Get.find();
    c.getUperInfoAndVideos(mid: mid);
    return Obx(() {
      if (c.isOk) {
        final card = c.uperInfoRes.value.data!.card!;
        final videos = c.uperVideosRes.value.data!.list!.vlist;
        return Card(
          child: Column(
            children: [
              UperCardDisplay(
                name: card.name,
                sign: card.sign,
                mid: int.parse(card.mid),
                face: card.face,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: videos
                      .map((video) => Chip(
                            label: Text(video.title!),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class AddUperPage extends StatelessWidget {
  const AddUperPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AddUperController());
    var inputUidController = TextEditingController();

    /// 用于保存输入值

    return Scaffold(
      appBar: AppBar(
        title: const Text("添加 up 主"),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => TextField(
                  enabled: c.queryUid.value == "",
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("UID")),
                  controller: inputUidController,
                  onChanged: (value) => c.inputUid.value = value,
                )),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Obx(() {
                if (c.queryUid.value == "") {
                  return IconButton(
                    onPressed: () => {c.queryUid.value = c.inputUid.value},
                    icon: const Icon(Icons.add),
                  );
                }
                return Wrap(children: [
                  IconButton(
                    onPressed: () => c.init(),
                    icon: const Icon(Icons.close),
                  ),
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () async {
                      await c.subscribe();
                    },
                  )
                ]);
              }),
            ),
            Obx(() {
              if (c.queryUid.value == "") {
                return const SizedBox();
              }
              return Container(
                margin: const EdgeInsets.only(top: 16),
                child: UperInfo(mid: int.parse(c.queryUid.value)),
              );
            })
          ],
        ),
      )),
    );
  }
}
