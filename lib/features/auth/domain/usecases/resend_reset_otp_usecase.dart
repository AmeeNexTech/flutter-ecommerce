import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class ResendResetOtpUseCase {
  final AuthRepository repository;
  ResendResetOtpUseCase(this.repository);

  Future<Either<Failure, ForgotPasswordResponse>> call(
    ResendResetOtpParams params,
  ) async {
    return await repository.resendResetOtp(email: params.email);
  }
}

class ResendResetOtpParams extends Equatable {
  final String email;
  const ResendResetOtpParams({required this.email});
  @override
  List<Object?> get props => [email];
}
