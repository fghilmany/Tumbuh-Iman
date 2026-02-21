import 'package:json_annotation/json_annotation.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/surah_detail_model.dart';

part 'quran_detail_response_model.g.dart';

/// Model for Quran Detail API Response (single surah)
@JsonSerializable(explicitToJson: true)
class QuranDetailResponseModel {
  final int code;
  final String message;
  final SurahDetailModel data;

  const QuranDetailResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  /// Create from JSON
  factory QuranDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuranDetailResponseModelFromJson(json);

  /// Convert to JSON
  Map<String, dynamic> toJson() => _$QuranDetailResponseModelToJson(this);

  /// Create copy with modified fields
  QuranDetailResponseModel copyWith({
    int? code,
    String? message,
    SurahDetailModel? data,
  }) {
    return QuranDetailResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
