import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

// نموذج استجابة التسجيل
@JsonSerializable()
class RegisterResponse {
  final String status;
  final String message;
  final RegisterData data;
  final String timestamp;

  RegisterResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class RegisterData {
  final String email;
  @JsonKey(name: 'otp_expires_at')
  final String otpExpiresAt;

  RegisterData({required this.email, required this.otpExpiresAt});

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}

// نموذج استجابة التحقق من OTP
@JsonSerializable()
class VerifyOtpResponse {
  final String status;
  final String message;
  final VerifyOtpData data;
  final String timestamp;

  VerifyOtpResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}

@JsonSerializable()
class VerifyOtpData {
  final UserModel user;
  final String token;

  VerifyOtpData({required this.user, required this.token});

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDataFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpDataToJson(this);
}
