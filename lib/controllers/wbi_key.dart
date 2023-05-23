import 'dart:developer';

import 'package:bilibili_subscriber/api/get_wbi_keys.dart';
import 'package:bilibili_subscriber/utils/sign_wbi.dart';
import 'package:get/get.dart';

class WbiKeyService extends GetxService {
  late final WbiKeys wbiKeys;
  Future<WbiKeyService> init() async {
    wbiKeys = await getWbiKeys();
    log("WbiKeyService inited.", name: "WbiKeyService");
    return this;
  }

  String signQuery(Map<String, dynamic> query) {
    final imgKey = wbiKeys.imgKey;
    final subKey = wbiKeys.subKey;
    return signWbi(query: query, imgKey: imgKey, subKey: subKey);
  }
}
