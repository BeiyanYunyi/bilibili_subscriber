import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

import 'components/navigation_bars.dart';
import 'controllers/db.dart';
import 'controllers/navigation.dart';
import 'controllers/wbi_key.dart';

Future<void> initServices() async {
  await Future.wait([
    Get.putAsync(() => DbService().init()),
    Get.putAsync(() => WbiKeyService().init())
  ]);
  Get.put(NavigationController());
}

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.find();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        fontFamily: defaultTargetPlatform == TargetPlatform.windows
            ? 'Microsoft YaHei UI'
            : null,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.dark,
        fontFamily: defaultTargetPlatform == TargetPlatform.windows
            ? 'Microsoft YaHei UI'
            : null,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("bilibili 订阅"),
        ),
        body: controller.getScreen(),
        bottomNavigationBar: const NavigationBars(),
        floatingActionButton: controller.getFab(),
      ),
    );
  }
}
