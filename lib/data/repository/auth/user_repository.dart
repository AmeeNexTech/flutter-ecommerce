import '../../datasource/remote/auth/user_remote_datasource.dart';
import '../../model/auth/user_model.dart';
import 'package:get/get.dart';

abstract class IUserRepository {
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<VerifyOtpResponse> verifyOtp({
    required String email,
    required String otp,
  });

  Future<RegisterResponse> resendOtp({required String email});

  Future<LoginResponse> login({
    required String email,
    required String password,
  });
}

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource _remoteDataSource =
      Get.find<IUserRemoteDataSource>();

  @override
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    return await _remoteDataSource.register(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
  }

  @override
  Future<VerifyOtpResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return await _remoteDataSource.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<RegisterResponse> resendOtp({required String email}) async {
    return await _remoteDataSource.resendOtp(email: email);
  }

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    return await _remoteDataSource.login(email: email, password: password);
  }
}
