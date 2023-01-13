import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_navigation_destination.dart';
import '../interfaces/app_page.dart';
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
