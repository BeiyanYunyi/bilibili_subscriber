import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlOrShowSnackbar(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    Get.snackbar("错误", "无法打开 $url", duration: const Duration(seconds: 1));
  }
}
