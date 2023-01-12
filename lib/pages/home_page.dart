import 'package:bilibili_subscriber/components/video_card.dart';
import 'package:bilibili_subscriber/controllers/db.dart';
import 'package:bilibili_subscriber/interfaces/app_page.dart';
import 'package:bilibili_subscriber/models/db/video.dart';
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
    db.isar.videos.where().sortByPublishTime().findAll().then(
      (value) {
        videos.value = value;
      },
    );
    return Obx(
      () => GridView.extent(
        maxCrossAxisExtent: 390,
        childAspectRatio: 0.9,
        shrinkWrap: true,
        children: videos.map((video) => VideoCard(video: video)).toList(),
      ),
    );
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
  final fab = const SizedBox();

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
