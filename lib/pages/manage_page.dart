import 'package:bilibili_subscriber/components/uper_card.dart';
import 'package:bilibili_subscriber/controllers/db.dart';
import 'package:bilibili_subscriber/controllers/upers.dart';
import 'package:bilibili_subscriber/interfaces/app_page.dart';
import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/pages/add_uper_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_navigation_destination.dart';

class ManagePageContent extends StatelessWidget {
  const ManagePageContent({super.key});
  @override
  Widget build(BuildContext context) {
    UpersController c = Get.put(UpersController());
    DbService db = Get.find();
    db.isar.upers.watchLazy().listen((e) => c.load());
    c.load();
    return Obx(() => ListView(
        children: c.upers.map((uper) => UperCard(uper: uper)).toList()));
  }
}

class ManagePageFab extends StatelessWidget {
  const ManagePageFab({super.key});
  @override
  build(context) {
    return FloatingActionButton(
        onPressed: () => Get.to(() => const AddUperPage()),
        child: const Icon(Icons.add));
  }
}

class ManagePage implements AppPage {
  @override
  final String title = "管理";
  @override
  final IconData icon = Icons.widgets_outlined;
  @override
  final IconData selectedIcon = Icons.widgets;

  const ManagePage();

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
  final content = const ManagePageContent();
  @override
  final fab = const ManagePageFab();
}
