// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseList<T> _$BaseResponseListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponseList<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BaseResponseListToJson<T>(
  BaseResponseList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.map(toJsonT).toList(),
    };
