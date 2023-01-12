import 'package:bilibili_subscriber/components/video_card.dart';
import 'package:bilibili_subscriber/controllers/db.dart';
import 'package:bilibili_subscriber/interfaces/app_page.dart';
import 'package:bilibili_subscriber/models/db/video.dart';
import 'package:bilibili_subscriber/pages/update_all_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../components/app_navigation_destination.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    DbService db = Get.find();
    final videos = <Video>[].obs;
    db.isar.videos.watchLazy(fireImmediately: true).listen((event) async {
      final value = await db.isar.videos.where().sortByPublishTime().findAll();
      videos.value = value;
    });
    return Obx(
      () {
        if (videos.isEmpty) return const Center(child: Text("暂无视频"));
        return GridView.extent(
          maxCrossAxisExtent: 292.6,
          childAspectRatio: 0.88,
          shrinkWrap: true,
          children: videos.map((video) => VideoCard(video: video)).toList(),
        );
      },
    );
  }
}

class HomePageFab extends StatelessWidget {
  const HomePageFab({super.key});
  @override
  build(context) {
    return FloatingActionButton(
        onPressed: () => Get.to(() => const UpdateAllPage()),
        child: const Icon(Icons.refresh));
  }
}

class HomePage implements AppPage {
  @override
  final String title = "更新";
  @override
  final IconData icon = Icons.home_outlined;
  @override
  final IconData selectedIcon = Icons.home;
  @override
  final fab = const HomePageFab();

  const HomePage();

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
  final content = const HomePageContent();
}
