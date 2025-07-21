import 'package:dio/dio.dart';
import '../../constant/api_endpoints.dart';
import '../storage/token_service.dart';
import 'package:get/get.dart';

class DioClient extends GetxService {
  late Dio _dio;
  final TokenService _tokenService = Get.find<TokenService>();

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 40),
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
