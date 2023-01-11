import 'package:flutter/material.dart';

class AppNavigationDestination extends StatelessWidget {
  final int index;
  final IconData icon;
  final IconData selectedIcon;
  final String title;

  const AppNavigationDestination({
    super.key,
    required this.title,
    required this.icon,
    required this.selectedIcon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      tooltip: title,
      icon: Icon(icon),
      label: title,
      selectedIcon: Icon(selectedIcon),
    );
  }
}
