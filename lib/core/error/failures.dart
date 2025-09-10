import 'package:equatable/equatable.dart';

// الكلاس الأساسي لجميع أنواع الفشل في التطبيق
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// يمثل الفشل الناتج عن خطأ في الخادم (API)
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
