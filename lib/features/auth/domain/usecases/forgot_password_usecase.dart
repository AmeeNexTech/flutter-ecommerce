import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;
  ForgotPasswordUseCase(this.repository);

  Future<Either<Failure, ForgotPasswordResponse>> call(
    ForgotPasswordParams params,
  ) async {
    return await repository.forgotPassword(email: params.email);
  }
}

class ForgotPasswordParams extends Equatable {
  final String email;
  const ForgotPasswordParams({required this.email});
  @override
  List<Object?> get props => [email];
}
