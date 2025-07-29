// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errors: json['errors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'errors': instance.errors,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedResponse<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      total: json['total'] as int,
      page: json['page'] as int,
      limit: json['limit'] as int,
      hasNext: json['hasNext'] as bool,
      hasPrevious: json['hasPrevious'] as bool,
    );

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'hasNext': instance.hasNext,
      'hasPrevious': instance.hasPrevious,
    };

HealthResponse _$HealthResponseFromJson(Map<String, dynamic> json) =>
    HealthResponse(
      status: json['status'] as String,
      service: json['service'] as String,
      version: json['version'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$HealthResponseToJson(HealthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'service': instance.service,
      'version': instance.version,
      'time': instance.time,
    };