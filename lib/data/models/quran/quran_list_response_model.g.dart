// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranListResponseModel _$QuranListResponseModelFromJson(
  Map<String, dynamic> json,
) => QuranListResponseModel(
  code: (json['code'] as num).toInt(),
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => SurahModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuranListResponseModelToJson(
  QuranListResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'data': instance.data.map((e) => e.toJson()).toList(),
};
