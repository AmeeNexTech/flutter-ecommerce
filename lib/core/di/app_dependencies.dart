import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/resend_reset_otp_usecase.dart';
import '../../features/auth/domain/usecases/delete_account_usecase.dart';
import '../../features/auth/domain/usecases/resend_otp_usecase.dart';
import '../../features/auth/domain/usecases/reset_password_usecase.dart';
import '../../features/auth/domain/usecases/forgot_password_usecase.dart';
import '../../features/auth/domain/usecases/verify_reset_otp_usecase.dart';
import '../../features/auth/domain/usecases/verify_otp_usecase.dart';
import '../services/network/dio_client.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../services/storage/local_storage_service.dart';
import '../services/storage/token_service.dart';
import '../localization/changelocal.dart';
import '../../features/auth/data/datasources/user_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import 'package:get/get.dart';

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

      // LocalStorageService بعد التأكد من تهيئة LocaleController حقن
      Get.lazyPut<LocaleController>(() => LocaleController(), fenix: true);

      // مصادر البيانات
      Get.lazyPut<IUserRemoteDataSource>(
        () => UserRemoteDataSource(),
        fenix: true,
      );

      //  المستودعات
      Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(), fenix: true);

      // حالات الاستخدام (Use Cases)
      Get.lazyPut(() => LoginUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => RegisterUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => VerifyOtpUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => ResendOtpUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => ForgotPasswordUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => VerifyResetOtpUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => ResendResetOtpUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => DeleteAccountUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => LogoutUseCase(Get.find()), fenix: true);
      Get.lazyPut(() => ResetPasswordUseCase(Get.find()), fenix: true);
    } catch (e) {
      rethrow;
    }
  }
}
