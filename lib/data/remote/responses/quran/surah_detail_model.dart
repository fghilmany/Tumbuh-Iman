import 'package:json_annotation/json_annotation.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/ayah_model.dart';

part 'surah_detail_model.g.dart';

/// Model for a single Surah detail response — includes ayat list
@JsonSerializable(explicitToJson: true)
class SurahDetailModel {
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
  @JsonKey(name: "ayat")
  final List<AyahModel> ayat;

  const SurahDetailModel({
    required this.number,
    required this.name,
    required this.latinName,
    required this.numberOfAyah,
    required this.placeOfRevelation,
    required this.meaning,
    required this.description,
    required this.audioFull,
    required this.ayat,
  });

  factory SurahDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SurahDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahDetailModelToJson(this);

  SurahDetailModel copyWith({
    int? number,
    String? name,
    String? latinName,
    int? numberOfAyah,
    String? placeOfRevelation,
    String? meaning,
    String? description,
    Map<String, String>? audioFull,
    List<AyahModel>? ayat,
  }) {
    return SurahDetailModel(
      number: number ?? this.number,
      name: name ?? this.name,
      latinName: latinName ?? this.latinName,
      numberOfAyah: numberOfAyah ?? this.numberOfAyah,
      placeOfRevelation: placeOfRevelation ?? this.placeOfRevelation,
      meaning: meaning ?? this.meaning,
      description: description ?? this.description,
      audioFull: audioFull ?? this.audioFull,
      ayat: ayat ?? this.ayat,
    );
  }
}
