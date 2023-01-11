import 'package:bilibili_subscriber/components/app_navigation_destination.dart';
import 'package:flutter/material.dart';

abstract class AppPage {
  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final Widget content;
  final Widget fab;

  const AppPage(
      {required this.icon,
      required this.selectedIcon,
      required this.title,
      required this.content,
      required this.fab});

  AppNavigationDestination getNavigationDestination(int index) {
    return AppNavigationDestination(
      title: title,
      icon: icon,
      selectedIcon: selectedIcon,
      index: index,
    );
  }
}
