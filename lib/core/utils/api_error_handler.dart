import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handleError(error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return 'Connection timeout. Please check your internet connection.';

        case DioExceptionType.badResponse:
          return _handleResponseError(error.response);

        case DioExceptionType.cancel:
          return 'Request was cancelled';

        case DioExceptionType.connectionError:
          return 'No internet connection';

        default:
          return 'Something went wrong. Please try again.';
      }
    }
    return 'An unexpected error occurred.';
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
          return 'Bad request. Please check your input.';
        case 401:
          return 'Unauthorized. Please login again.';
        case 403:
          return 'Access denied.';
        case 404:
          return 'Resource not found.';
        case 422:
          return 'Validation failed. Please check your input.';
        case 429:
          return 'Too many requests. Please try again later.';
        case 500:
          return 'Server error. Please try again later.';
        default:
          return 'Something went wrong.';
      }
    }

    return 'An error occurred while processing the request.';
  }
}
