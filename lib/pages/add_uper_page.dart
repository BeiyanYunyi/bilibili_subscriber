import 'package:bilibili_subscriber/api/get_uper_info.dart';
import 'package:bilibili_subscriber/api/get_uper_videos.dart';
import 'package:bilibili_subscriber/components/uper_card.dart';
import 'package:bilibili_subscriber/controllers/db.dart';
import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/models/uper_info_res/uper_info_res.dart';
import 'package:bilibili_subscriber/models/uper_videos_res/uper_videos_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

Future<Tuple2<T1, T2>> waitConcurrently<T1, T2>(
    Future<T1> future1, Future<T2> future2) async {
  late T1 result1;
  late T2 result2;

  await Future.wait([
    future1.then((value) => result1 = value),
    future2.then((value) => result2 = value)
  ]);

  return Future.value(Tuple2(result1, result2));
}

Future<Tuple2<UperInfoRes, UperVideosRes>> getUperInfoAndVideos(
    {required int mid}) async {
  final uperInfoFuture = getUperInfo(mid: mid);
  final uperVideosFuture = getUperVideos(mid: mid, pn: 1);
  final result = await waitConcurrently(uperInfoFuture, uperVideosFuture);
  return result;
}

class UperInfo extends StatelessWidget {
  const UperInfo({super.key, required this.mid});

  final int mid;

  @override
  Widget build(BuildContext context) {
    DbService dbService = Get.find();
    return FutureBuilder(
        future: getUperInfoAndVideos(mid: mid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data?.item1.data?.card != null &&
              snapshot.data?.item2.data?.list?.vlist != null) {
            final card = snapshot.data!.item1.data!.card!;
            final videos = snapshot.data!.item2.data!.list!.vlist;
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
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () async {
                      final uper = Uper.fromCard(card);
                      await dbService.isar.writeTxn(() async {
                        await dbService.isar.upers.put(uper);
                      });
                      await uper.updateVideos();
                      Get.back();
                      Get.snackbar("成功", "已成功添加 UP 主: ${uper.name}");
                    },
                  )
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
    /// 用于保存输入值
    var inputUid = "".obs;
    var inputUidController = TextEditingController();
    var queryUid = "".obs;
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
                  enabled: queryUid.value == "",
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("UID")),
                  controller: inputUidController,
                  onChanged: (value) => inputUid.value = value,
                )),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: IconButton(
                  onPressed: () => {
                        if (queryUid.value == "")
                          queryUid.value = inputUid.value
                        else
                          queryUid.value = ""
                      },
                  icon: Obx(() => queryUid.value == ""
                      ? const Icon(Icons.add)
                      : const Icon(Icons.close))),
            ),
            Obx(() {
              if (queryUid.value == "") {
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                );
              }
              return Container(
                margin: const EdgeInsets.only(top: 16),
                child: UperInfo(mid: int.parse(queryUid.value)),
              );
            })
          ],
        ),
      )),
    );
  }
}
