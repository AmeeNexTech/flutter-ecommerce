import 'package:dio/dio.dart';
import '../../constant/api_endpoints.dart';
import '../storage/token_service.dart';
import 'package:get/get.dart';
import '../../localization/changelocal.dart';
import '../storage/local_storage_service.dart';

class DioClient extends GetxService {
  late Dio _dio;
  final TokenService _tokenService = Get.find<TokenService>();

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
        sendTimeout: const Duration(seconds: 50), // Added send timeout
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          // Inject Accept-Language from current app locale
          String? langCode = Get.locale?.languageCode;
          if (langCode == null || langCode.isEmpty) {
            try {
              langCode = Get.find<LocaleController>().language?.languageCode;
            } catch (_) {}
          }
          if (langCode == null || langCode.isEmpty) {
            try {
              langCode = Get.find<LocalStorageService>().sharedPreferences
                  .getString('lang');
            } catch (_) {}
          }
          options.headers['Accept-Language'] = langCode ?? 'en';

          return handler.next(options);
        },
        onError: (error, handler) {
          handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
