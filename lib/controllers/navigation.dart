import 'package:bilibili_subscriber/pages/about_page.dart';
import 'package:bilibili_subscriber/pages/home_page.dart';
import 'package:bilibili_subscriber/pages/manage_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final _selectedIndex = 1.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int index) => _selectedIndex.value = index;
  final managepage = const ManagePage();
  final homepage = const HomePage();
  final aboutpage = const AboutPage();
  Widget getScreen() {
    return Obx(() {
      switch (selectedIndex) {
        case 0:
          return managepage.content;
        case 1:
          return homepage.content;
        case 2:
          return aboutpage.content;
        default:
          return homepage.content;
      }
    });
  }

  Widget getFab() {
    return Obx(() {
      switch (selectedIndex) {
        case 0:
          return managepage.fab;
        case 1:
          return homepage.fab;
        case 2:
          return aboutpage.fab;
        default:
          return homepage.fab;
      }
    });
  }
}
