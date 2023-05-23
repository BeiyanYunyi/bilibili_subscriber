import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/launch_url.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appMargin = 8.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("关于"),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "bilibili 订阅",
                style: context.theme.textTheme.headlineMedium,
              ),
              const Padding(
                padding: EdgeInsets.only(top: appMargin),
                child: Text("谨以此纪念我在 2021 年 6 月 11 日被 B 站无故永久封禁的 6 位数 UID 大号。"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: appMargin),
                child: Text(
                  "开发者",
                  style: context.theme.textTheme.headlineSmall,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: appMargin),
                child: Text("北雁云依"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: appMargin),
                child: Text(
                  "开源协议",
                  style: context.theme.textTheme.headlineSmall,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: appMargin),
                child: Text("本应用使用 AGPL-3.0 协议开源。"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: appMargin),
                child: ElevatedButton.icon(
                  onPressed: () => launchUrlOrShowSnackbar("https://github.com/BeiyanYunyi/bilibili_subscriber"),
                  label: const SelectionContainer.disabled(child: Text("查看源码")),
                  icon: const Icon(Icons.code),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
