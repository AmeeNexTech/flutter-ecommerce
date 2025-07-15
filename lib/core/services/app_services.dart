import 'package:get/get.dart';
import 'storage/local_storage_service.dart';
import 'storage/token_service.dart';

class AppServices extends GetxService {
  Future<AppServices> init() async {
    // تهيئة الخدمات الأخرى هنا لاحقاً
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => TokenService().init());
}
