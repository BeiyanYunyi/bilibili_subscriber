import 'package:bilibili_subscriber/controllers/navigation.dart';
import 'package:bilibili_subscriber/interfaces/app_page.dart';
import 'package:bilibili_subscriber/pages/about_page.dart';
import 'package:bilibili_subscriber/pages/manage_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_page.dart';
import 'app_navigation_destination.dart';

List<AppPage> pages = [
  const ManagePage(),
  const HomePage(),
  const AboutPage(),
];

List<AppNavigationDestination> appBarDestinations =
    pages.map((e) => e.getNavigationDestination(pages.indexOf(e))).toList();

class NavigationBars extends StatelessWidget {
  const NavigationBars({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.find();
    return Obx(() => NavigationBar(
          selectedIndex: controller.selectedIndex,
          destinations: appBarDestinations,
          onDestinationSelected: (index) {
            controller.selectedIndex = index;
          },
        ));
  }
}
