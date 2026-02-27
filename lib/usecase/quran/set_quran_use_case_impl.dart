import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/domain/repositories/quran/quran_repository.dart';
import 'package:tumbuh_iman/usecase/quran/set_quran_use_case.dart';

class SetQuranUseCaseImpl implements SetQuranUseCase {
  final QuranRepository _quranRepository;

  SetQuranUseCaseImpl(this._quranRepository);

  @override
  Future<Result<void>> setBookmarkStatus(int surahNumber, bool isBookmarked) {
    return _quranRepository.setBookmarkStatus(surahNumber, isBookmarked);
  }

  @override
  Future<Result<void>> setLastReadSurah(int surahNumber, {int? ayahNumber}) {
    return _quranRepository.setLastReadSurah(surahNumber, ayahNumber: ayahNumber);
  }

}