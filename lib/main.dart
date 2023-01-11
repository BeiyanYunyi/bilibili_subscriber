import 'package:bilibili_subscriber/controllers/navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

import 'components/navigation_bars.dart';
import 'controllers/db.dart';

Future<void> initServices() async {
  await Get.putAsync(() => DbService().init());
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        useMaterial3: true,
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
