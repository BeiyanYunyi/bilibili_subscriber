import 'package:bilibili_subscriber/components/uper_card.dart';
import 'package:bilibili_subscriber/interfaces/app_page.dart';
import 'package:bilibili_subscriber/models/db/uper.dart';
import 'package:bilibili_subscriber/pages/add_uper_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../components/app_navigation_destination.dart';
import '../controllers/db.dart';

class ManagePageContent extends StatelessWidget {
  const ManagePageContent({super.key});
  @override
  Widget build(BuildContext context) {
    DbService dbService = Get.find();
    return FutureBuilder(
        future: dbService.isar.upers.where().findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return ListView(
                children: snapshot.data!
                    .map((uper) => UperCard(uper: uper))
                    .toList());
          }
          return const Center(child: CircularProgressIndicator());
        });
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
