import 'package:bilibili_subscriber/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/db.dart';
import '../models/db/uper.dart';
import '../models/db/video.dart';

enum VideoCardOptions { remove, see }

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({super.key, required this.video});

  @override
  build(context) {
    DbService db = Get.find();

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => launchUrlOrShowSnackbar(
            "https://www.bilibili.com/video/${video.bvId}"),
        onLongPress: () async {
          final RenderBox card = context.findRenderObject() as RenderBox;
          final RenderBox overlay =
              navigator?.overlay?.context.findRenderObject() as RenderBox;
          final value = await showMenu(
              context: context,
              position: RelativeRect.fromRect(
                Rect.fromPoints(
                  card.localToGlobal(Offset.zero, ancestor: overlay),
                  card.localToGlobal(card.size.bottomRight(Offset.zero),
                      ancestor: overlay),
                ),
                Offset.zero & overlay.size,
              ),
              items: <PopupMenuEntry<VideoCardOptions>>[
                const PopupMenuItem(
                  value: VideoCardOptions.remove,
                  child: Text("删除"),
                ),
                const PopupMenuItem(
                  value: VideoCardOptions.see,
                  child: Text("已阅至此"),
                ),
              ]);
          switch (value) {
            case VideoCardOptions.remove:
              await db.isar.writeTxn(() async {
                db.isar.videos.delete(video.isarId);
              });
              Get.snackbar("成功", "已删除 ${video.title}",
                  duration: const Duration(seconds: 1));
              break;
            case VideoCardOptions.see:
              final uper = (await db.isar.upers.get(video.uperId))!;
              uper.lastSeen = video.publishTime;
              await db.isar.writeTxn(() async {
                db.isar.upers.put(uper);
              });
              await uper.trimVideos();
              Get.snackbar("成功", "已标记 ${video.uper.value!.name} 已阅至此",
                  duration: const Duration(seconds: 1));
              break;
            case null:
              break;
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              video.cover,
              isAntiAlias: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                video.title,
                textScaleFactor: 1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8, right: 8),
              child: Wrap(
                children: [
                  Chip(
                    avatar: ClipOval(
                      child: Image.network(
                        video.uper.value!.face,
                        isAntiAlias: true,
                      ),
                    ),
                    label: Text(
                      video.uper.value!.name,
                      textScaleFactor: 0.8,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
