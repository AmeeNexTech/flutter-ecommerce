// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
  emailVerifiedAt: json['email_verified_at'] as String?,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'email_verified_at': instance.emailVerifiedAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
  email: json['email'] as String,
  otpExpiresAt: json['otp_expires_at'] as String,
);

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp_expires_at': instance.otpExpiresAt,
    };

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: VerifyOtpData.fromJson(json['data'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(VerifyOtpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

VerifyOtpData _$VerifyOtpDataFromJson(Map<String, dynamic> json) =>
    VerifyOtpData(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$VerifyOtpDataToJson(VerifyOtpData instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};
