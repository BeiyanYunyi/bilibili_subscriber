import 'package:bilibili_subscriber/interfaces/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_navigation_destination.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    var count = 0.obs;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Obx(() => Text("更新$count", textScaleFactor: 5)),
          FloatingActionButton(onPressed: () => count += 1)
        ],
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
