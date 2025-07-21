import '../services/network/dio_client.dart';
import '../services/storage/local_storage_service.dart';
import '../services/storage/token_service.dart';
import '../localization/changelocal.dart';
import '../../data/datasource/remote/auth/user_remote_datasource.dart';
import '../../data/repository/auth/user_repository.dart';
import 'package:get/get.dart';

import '../utils/app_logger.dart';

class AppDependencies {
  static Future<void> init() async {
    try {
      // ==== الخدمات الأساسية (تسجل عند بداية التطبيق)  =====

      // خدمات التخزين الآمن (تهيئة غير متزامنة)
      await Get.putAsync<LocalStorageService>(
        () async => await LocalStorageService().init(),
        permanent: true,
      );

      Get.put(TokenService(), permanent: true);
      Get.put(DioClient(), permanent: true);

      // ===== خدمات التطبيق =====

      // حقن LocaleController بعد التأكد من تهيئة LocalStorageService
      Get.lazyPut<LocaleController>(() => LocaleController(), fenix: true);

      // مصادر البيانات
      Get.lazyPut<IUserRemoteDataSource>(
        () => UserRemoteDataSource(),
        fenix: true,
      );

      //  المستودعات
      Get.lazyPut<IUserRepository>(() => UserRepository(), fenix: true);
      Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);

      AppLogger.i('✅ App Dependencies initialized successfully');
    } catch (e) {
      AppLogger.e('❌ Error initializing App Dependencies: $e');
      rethrow;
    }
  }
}
