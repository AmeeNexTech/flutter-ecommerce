import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository repository;
  ResendOtpUseCase(this.repository);

  Future<Either<Failure, RegisterResponse>> call(ResendOtpParams params) async {
    return await repository.resendOtp(email: params.email);
  }
}

class ResendOtpParams extends Equatable {
  final String email;

  const ResendOtpParams({required this.email});

  @override
  List<Object?> get props => [email];
}
