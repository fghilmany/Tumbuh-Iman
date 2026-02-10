import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

/// Model for Surah that can be serialized from/to JSON
@JsonSerializable()
class SurahModel {
  @JsonKey(name: "nomor")
  final int number;
  @JsonKey(name: "nama")
  final String name;
  @JsonKey(name: "namaLatin")
  final String latinName;
  @JsonKey(name: "jumlahAyat")
  final int numberOfAyah;
  @JsonKey(name: "tempatTurun")
  final String placeOfRevelation;
  @JsonKey(name: "arti")
  final String meaning;
  @JsonKey(name: "deskripsi")
  final String description;
  @JsonKey(name: "audioFull")
  final Map<String, String> audioFull;

  const SurahModel({
    required this.number,
    required this.name,
    required this.latinName,
    required this.numberOfAyah,
    required this.placeOfRevelation,
    required this.meaning,
    required this.description,
    required this.audioFull,
  });

  /// Create from JSON
  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  /// Convert to JSON
  Map<String, dynamic> toJson() => _$SurahModelToJson(this);

  /// Create copy with modified fields
  SurahModel copyWith({
    int? number,
    String? name,
    String? latinName,
    int? numberOfAyah,
    String? placeOfRevelation,
    String? meaning,
    String? description,
    Map<String, String>? audioFull,
  }) {
    return SurahModel(
      number: number ?? this.number,
      name: name ?? this.name,
      latinName: latinName ?? this.latinName,
      numberOfAyah: numberOfAyah ?? this.numberOfAyah,
      placeOfRevelation: placeOfRevelation ?? this.placeOfRevelation,
      meaning: meaning ?? this.meaning,
      description: description ?? this.description,
      audioFull: audioFull ?? this.audioFull,
    );
  }
}

