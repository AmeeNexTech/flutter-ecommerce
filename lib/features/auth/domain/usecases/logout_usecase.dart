import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);

  Future<Either<Failure, LogoutResponse>> call() async {
    return await repository.logout();
  }
}
