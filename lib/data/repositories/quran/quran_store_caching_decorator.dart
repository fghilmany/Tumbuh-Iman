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
  Future<Result<SurahEntity?>> getSurahById(int id) {
    return _wrapped.getSurahById(id);
  }
}
