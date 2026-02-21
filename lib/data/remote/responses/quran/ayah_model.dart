import 'package:json_annotation/json_annotation.dart';

part 'ayah_model.g.dart';

/// Model for a single Ayah (verse)
@JsonSerializable()
class AyahModel {
  @JsonKey(name: "nomorAyat")
  final int number;
  @JsonKey(name: "teksArab")
  final String arabicText;
  @JsonKey(name: "teksLatin")
  final String latinText;
  @JsonKey(name: "teksIndonesia")
  final String indonesianText;
  @JsonKey(name: "audio")
  final Map<String, String> audio;

  const AyahModel({
    required this.number,
    required this.arabicText,
    required this.latinText,
    required this.indonesianText,
    required this.audio,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) =>
      _$AyahModelFromJson(json);

  Map<String, dynamic> toJson() => _$AyahModelToJson(this);

  AyahModel copyWith({
    int? number,
    String? arabicText,
    String? latinText,
    String? indonesianText,
    Map<String, String>? audio,
  }) {
    return AyahModel(
      number: number ?? this.number,
      arabicText: arabicText ?? this.arabicText,
      latinText: latinText ?? this.latinText,
      indonesianText: indonesianText ?? this.indonesianText,
      audio: audio ?? this.audio,
    );
  }
}
