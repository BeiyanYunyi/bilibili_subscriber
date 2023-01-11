import 'package:bilibili_subscriber/interfaces/app_page.dart';
import 'package:flutter/material.dart';

import '../components/app_navigation_destination.dart';

class AboutPageContent extends StatelessWidget {
  const AboutPageContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("关于", textScaleFactor: 5),
    );
  }
}

class AboutPage implements AppPage {
  @override
  final String title = "关于";
  @override
  final IconData icon = Icons.info_outlined;
  @override
  final IconData selectedIcon = Icons.info;
  @override
  final fab = const SizedBox();

  const AboutPage();

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
  final content = const AboutPageContent();
}
