import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class ApiErrorHandler {
  static String handleError(error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'error.connection_timeout'.tr;

        case DioExceptionType.badResponse:
          return _handleResponseError(error.response);

        case DioExceptionType.cancel:
          return 'error.request_cancelled'.tr;

        case DioExceptionType.connectionError:
          return 'error.no_internet'.tr;

        default:
          return 'error.generic_try_again'.tr;
      }
    }
    return 'error.unexpected'.tr;
  }

  static String _handleResponseError(Response? response) {
    if (response?.data is Map<String, dynamic>) {
      final data = response!.data as Map<String, dynamic>;

      if (data.containsKey('errors')) {
        final errors = data['errors'] as Map<String, dynamic>;
        final firstError = errors.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          return firstError.first.toString();
        }
      }

      if (data.containsKey('message')) {
        return data['message'] as String;
      }

      switch (response.statusCode) {
        case 400:
          return 'error.bad_request'.tr;
        case 401:
          return 'error.unauthorized'.tr;
        case 403:
          return 'error.forbidden'.tr;
        case 404:
          return 'error.not_found'.tr;
        case 422:
          return 'error.validation_failed'.tr;
        case 429:
          return 'error.too_many_requests'.tr;
        case 500:
          return 'error.server_error'.tr;
        default:
          return 'error.something_wrong'.tr;
      }
    }

    return 'error.processing_request'.tr;
  }
}
