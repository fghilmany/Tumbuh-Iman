import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';
import 'package:tumbuh_iman/domain/repositories/quran/quran_repository.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';

class GetQuranUseCaseImpl implements GetQuranUseCase {
  final QuranRepository _quranRepository;

  GetQuranUseCaseImpl(this._quranRepository);

  @override
  Future<Result<QuranEntity?>> getSurahList({bool onlyStore = false}) {
    return _quranRepository.getSurahList(onlyStore: onlyStore);
  }

  @override
  Future<Result<SurahEntity?>> getSurahById(int id) {
    return _quranRepository.getSurahById(id);
  }
}