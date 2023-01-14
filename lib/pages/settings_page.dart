import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_navigation_destination.dart';
import '../interfaces/app_page.dart';
import '../models/db/uper.dart';
import 'info_page.dart';

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = Get.isDarkMode.obs;
    dark.listen((val) {
      if (val) return Get.changeThemeMode(ThemeMode.dark);
      return Get.changeThemeMode(ThemeMode.light);
    });
    final manualString = "".obs;
    return ListView(
      padding: const EdgeInsets.only(top: 8),
      children: <Widget>[
        ListTile(
          title: const Text("关于"),
          leading: const Icon(Icons.info_outline),
          onTap: () => Get.to(() => const InfoPage()),
        ),
        Obx(() => SwitchListTile(
              value: dark.value,
              onChanged: (val) => dark.value = val,
              title: const Text("夜间模式"),
              secondary: Icon(dark.value
                  ? Icons.dark_mode_outlined
                  : Icons.wb_sunny_outlined),
            )),
        ListTile(
          title: const Text("导出订阅信息到剪贴板"),
          leading: const Icon(Icons.send_to_mobile_outlined),
          onTap: () async {
            final json = await Uper.exportToJson();
            await FlutterClipboard.copy(json);
            Get.snackbar("成功", "已复制到剪贴板", duration: const Duration(seconds: 1));
          },
        ),
        ListTile(
          title: const Text("从剪贴板导入信息"),
          leading: const Icon(Icons.install_mobile_outlined),
          onTap: () async {
            try {
              final json = await FlutterClipboard.paste();
              await Uper.importFromJson(json);
              Get.snackbar("成功", "成功导入", duration: const Duration(seconds: 1));
            } catch (e) {
              Get.snackbar("错误", "导入失败", duration: const Duration(seconds: 1));
            }
          },
        ),
        ListTile(
          title: const Text("导入信息（手动输入）"),
          subtitle: const Text("适用于禁止 app 读取剪贴板的情况"),
          leading: const Icon(Icons.install_mobile_outlined),
          onTap: () async {
            await Get.defaultDialog(
              title: "手动输入",
              content: TextField(
                autofocus: true,
                maxLines: 5,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("手动输入")),
                onChanged: ((value) => manualString.value = value),
              ),
              cancel: TextButton.icon(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                  label: const Text("取消")),
              confirm: TextButton.icon(
                  onPressed: () async {
                    try {
                      await Uper.importFromJson(manualString.value);
                      Get.back();
                      Get.snackbar("成功", "成功导入",
                          duration: const Duration(seconds: 1));
                    } catch (e) {
                      Get.back();
                      Get.snackbar("错误", "导入失败",
                          duration: const Duration(seconds: 1));
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("导入")),
            );
          },
        ),
      ],
    );
  }
}

class SettingsPage implements AppPage {
  @override
  final String title = "设置";
  @override
  final IconData icon = Icons.settings_outlined;
  @override
  final IconData selectedIcon = Icons.settings;
  @override
  final fab = const SizedBox();

  const SettingsPage();

  @override
  getNavigationDestination(int index) {
    return AppNavigationDestination(
      title: title,
      icon: icon,
      selectedIcon: selectedIcon,
      index: index,
    );
  }

  @override
  final content = const SettingsPageContent();
}
