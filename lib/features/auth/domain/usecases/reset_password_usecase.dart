import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;
  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, ResetPasswordResponse>> call(
    ResetPasswordParams params,
  ) async {
    return await repository.resetPassword(
      email: params.email,
      otp: params.otp,
      password: params.password,
      passwordConfirmation: params.passwordConfirmation,
    );
  }
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String otp;
  final String password;
  final String passwordConfirmation;

  const ResetPasswordParams({
    required this.email,
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object?> get props => [email, otp, password, passwordConfirmation];
}
