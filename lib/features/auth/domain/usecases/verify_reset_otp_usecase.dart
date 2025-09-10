import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class VerifyResetOtpUseCase {
  final AuthRepository repository;
  VerifyResetOtpUseCase(this.repository);

  Future<Either<Failure, VerifyResetOtpResponse>> call(
    VerifyResetOtpParams params,
  ) async {
    return await repository.verifyResetOtp(
      email: params.email,
      otp: params.otp,
    );
  }
}

class VerifyResetOtpParams extends Equatable {
  final String email;
  final String otp;
  const VerifyResetOtpParams({required this.email, required this.otp});
  @override
  List<Object?> get props => [email, otp];
}
