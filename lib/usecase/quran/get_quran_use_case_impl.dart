import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/repositories/quran/quran_repository.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';

class GetQuranUseCaseImpl implements GetQuranUseCase {
  final QuranRepository _quranRepository;

  GetQuranUseCaseImpl(this._quranRepository);

  @override
  Future<Result<QuranEntity>> getSurahList() {
    return _quranRepository.getSurahList();
  }

}