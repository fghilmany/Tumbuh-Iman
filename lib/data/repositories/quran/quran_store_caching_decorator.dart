import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/data/local/quran/quran_local_data_source.dart';
import 'package:tumbuh_iman/data/mapper/quran_mapper.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/entities/quran/surah_entity.dart';
import 'package:tumbuh_iman/domain/repositories/quran/quran_repository.dart';

class QuranStoreCachingDecorator implements QuranRepository {
  final QuranLocalDataSource _localDataSource;
  final QuranRepository _wrapped;

  QuranStoreCachingDecorator({
    required QuranLocalDataSource localDataSource,
    required QuranRepository wrapped,
  }) : _localDataSource = localDataSource,
       _wrapped = wrapped;

  @override
  Future<Result<QuranEntity?>> getSurahList({bool onlyStore = false}) async {
    final hasLocalData = await _localDataSource.hasData();
    if (hasLocalData) {
      if (onlyStore) {
        return Result.success(null);
      } else {
        final localData = await _localDataSource.getListSurah();
        return Result.success(localData.toEntity());
      }
    }
    final result = await _wrapped.getSurahList();
    result.when(
      success: (data) async {
        if (data != null){
          await _localDataSource.storeSurahList(data);
        }
      },
      failure: (_, _) {},
    );
    return result;
  }

  @override
  Future<Result<SurahEntity?>> getSurahById(int id) async {
    final hasAyahs = await _localDataSource.hasAyahsForSurah(id);
    if (hasAyahs) {
      final localData = await _localDataSource.getSurahById(id);
      return Result.success(localData?.toEntity());
    }
    final result = await  _wrapped.getSurahById(id);
    result.when(
      success: (data) async {
        if (data != null){
          await _localDataSource.storeAyahs(data);
        }
      },
      failure: (_, _) {},
    );
    return result;
  }

  @override
  Future<Result<int>> getBookmarkedSurahId() async {
    try {
      final data = await _localDataSource.getBookmarkedSurahs();
      return Result.success(data);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<int>> getLastReadSurahId() async {
    try {
      final data = await _localDataSource.getLastReadSurah();
      if (data == null) {
        return Result.failure('No last read surah found');
      }
      return Result.success(data.surah.surahNumber);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<void>> setBookmarkStatus(int surahNumber, bool isBookmarked) async {
    try {

      await _localDataSource.updateBookmarkStatus(surahNumber, isBookmarked);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<void>> setLastReadSurah(int surahNumber, {int? ayahNumber}) async {
    try {
      await _localDataSource.setLastReadSurah(surahNumber, ayahNumber: ayahNumber);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
