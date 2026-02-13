import 'package:talker_flutter/talker_flutter.dart';
import 'package:tumbuh_iman/core/utils/result.dart';
import 'package:tumbuh_iman/data/mapper/quran_mapper.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_remote_data_source.dart';
import 'package:tumbuh_iman/domain/entities/quran/quran_entity.dart';
import 'package:tumbuh_iman/domain/repositories/quran/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {

  final QuranRemoteDataSource _remoteDataSource;
  final Talker _talker;

  QuranRepositoryImpl(
      this._remoteDataSource,
      this._talker,
      );

  @override
  Future<Result<QuranEntity?>> getSurahList({bool onlyStore = false}) async {
    try {
      _talker.debug('📖 Starting getSurahList in QuranRepositoryImpl...');

      final response = await _remoteDataSource.getSurahList();
      final quranEntity = response.toEntity();
      _talker.info('✅ Successfully converted response to QuranEntity');
      return Result.success(quranEntity);
    } catch (e, stackTrace) {
      _talker.error(
        '❌ Error in getSurahList',
        e,
        stackTrace,
      );
      return Result.failure(e.toString());
    }
  }
}