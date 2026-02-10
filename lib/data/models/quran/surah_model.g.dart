// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
  number: (json['nomor'] as num).toInt(),
  name: json['nama'] as String,
  latinName: json['namaLatin'] as String,
  numberOfAyah: (json['jumlahAyat'] as num).toInt(),
  placeOfRevelation: json['tempatTurun'] as String,
  meaning: json['arti'] as String,
  description: json['deskripsi'] as String,
  audioFull: Map<String, String>.from(json['audioFull'] as Map),
);

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'nomor': instance.number,
      'nama': instance.name,
      'namaLatin': instance.latinName,
      'jumlahAyat': instance.numberOfAyah,
      'tempatTurun': instance.placeOfRevelation,
      'arti': instance.meaning,
      'deskripsi': instance.description,
      'audioFull': instance.audioFull,
    };
