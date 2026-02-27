import 'package:tumbuh_iman/core/utils/result.dart';

abstract interface class SetQuranUseCase {
  /// Set bookmark status of a surah
  Future<Result<void>> setBookmarkStatus(int surahNumber, bool isBookmarked);
  /// Set last read surah
  Future<Result<void>> setLastReadSurah(int surahNumber, {int? ayahNumber});
}