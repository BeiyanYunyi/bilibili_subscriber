import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: Image.network(
          face,
          height: 48,
          width: 48,
        ),
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
          OutlinedButton.icon(
            onPressed: () async {
              final Uri uri =
                  Uri.parse("https://space.bilibili.com/${uper.id}");
              if (!await launchUrl(uri)) {
                Get.snackbar("错误", "无法打开 ${uri.toString()}",
                    duration: const Duration(seconds: 1));
              }
            },
            icon: const Icon(Icons.person),
            label: const Text("空间"),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              final res = await uper.update();
              Get.snackbar("成功", "成功更新 UP 主：${uper.name}，共 ${res.count} 条视频",
                  duration: const Duration(seconds: 1));
            },
            icon: const Icon(Icons.refresh),
            label: const Text("更新"),
          ),
          OutlinedButton.icon(
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
