import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<Either<Failure, RegisterResponse>> call(RegisterParams params) async {
    return await repository.register(
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  const RegisterParams({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  @override
  List<Object?> get props => [name, email, phoneNumber, password];
}
