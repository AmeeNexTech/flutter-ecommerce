import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterResponse>> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Either<Failure, RegisterResponse>> resendOtp({required String email});

  Future<Either<Failure, LoginResponse>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, LogoutResponse>> logout();

  Future<Either<Failure, DeleteAccountResponse>> deleteAccount({
    required String password,
  });

  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword({
    required String email,
  });

  Future<Either<Failure, VerifyResetOtpResponse>> verifyResetOtp({
    required String email,
    required String otp,
  });

  Future<Either<Failure, ForgotPasswordResponse>> resendResetOtp({
    required String email,
  });

  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  });
}
