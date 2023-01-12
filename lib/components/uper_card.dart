import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UperCardDisplay extends StatelessWidget {
  const UperCardDisplay({
    Key? key,
    required this.name,
    required this.sign,
    required this.mid,
    required this.face,
  }) : super(key: key);

  final String name;
  final String sign;
  final int mid;
  final String face;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        textScaleFactor: 1.2,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(sign),
          Text(
            mid.toString(),
            textScaleFactor: 0.8,
          ),
        ],
      ),
      leading: ClipOval(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () =>
                launchUrlOrShowSnackbar("https://space.bilibili.com/$mid"),
            child: Image.network(
              face,
              height: 48,
              width: 48,
            )),
      ),
      isThreeLine: true,
    );
  }
}

class UperCardManagement extends StatelessWidget {
  const UperCardManagement({super.key, required this.uper});

  final Uper uper;

  @override
  build(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await Get.defaultDialog(
                title: "确定取关",
                content: Text("确定要取关 UP 主 ${uper.name} 吗？"),
                cancel: TextButton.icon(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close),
                    label: const Text("取消")),
                confirm: TextButton.icon(
                    onPressed: () async {
                      await uper.delete();
                      Get.back();
                      Get.snackbar("成功", "已取关 UP 主 ${uper.name}");
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("确认")),
              );
            },
            icon: const Icon(Icons.delete_forever),
            label: const Text("取关"),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final res = await uper.update();
              Get.snackbar("成功", "成功更新 UP 主：${uper.name}，共 ${res.count} 条视频",
                  duration: const Duration(seconds: 1));
            },
            icon: const Icon(Icons.refresh),
            label: const Text("更新"),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              await uper.see();
              Get.snackbar("成功", "成功标记 UP 主：${uper.name} 为已阅",
                  duration: const Duration(seconds: 1));
            },
            icon: const Icon(Icons.check),
            label: const Text("已阅"),
          ),
        ],
      ),
    );
  }
}

class UperCard extends StatelessWidget {
  final Uper uper;

  const UperCard({super.key, required this.uper});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 2),
      child: Card(
        child: Column(
          children: [
            UperCardDisplay(
              name: uper.name,
              sign: uper.sign,
              mid: uper.id,
              face: uper.face,
            ),
            UperCardManagement(uper: uper)
          ],
        ),
      ),
    );
  }
}
