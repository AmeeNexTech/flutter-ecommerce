import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_model.dart';
import '../repositories/auth_repository.dart';

class DeleteAccountUseCase {
  final AuthRepository repository;
  DeleteAccountUseCase(this.repository);

  Future<Either<Failure, DeleteAccountResponse>> call(
    DeleteAccountParams params,
  ) async {
    return await repository.deleteAccount(password: params.password);
  }
}

class DeleteAccountParams extends Equatable {
  final String password;
  const DeleteAccountParams({required this.password});
  @override
  List<Object?> get props => [password];
}
