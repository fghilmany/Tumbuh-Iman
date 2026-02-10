import 'package:json_annotation/json_annotation.dart';
import 'package:tumbuh_iman/data/models/quran/surah_model.dart';

part 'quran_list_response_model.g.dart';

/// Model for Quran List API Response
@JsonSerializable(explicitToJson: true)
class QuranListResponseModel {
  final int code;
  final String message;
  final List<SurahModel> data;

  const QuranListResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  /// Create from JSON
  factory QuranListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuranListResponseModelFromJson(json);

  /// Convert to JSON
  Map<String, dynamic> toJson() => _$QuranListResponseModelToJson(this);

  /// Create copy with modified fields
  QuranListResponseModel copyWith({
    int? code,
    String? message,
    List<SurahModel>? data,
  }) {
    return QuranListResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

