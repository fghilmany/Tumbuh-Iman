import 'package:talker_flutter/talker_flutter.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_api_client.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_remote_data_source.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/quran_detail_response_model.dart';
import 'package:tumbuh_iman/data/remote/responses/quran/quran_list_response_model.dart';

/// Implementation of QuranRemoteDataSource
class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  final QuranApiClient _apiClient;
  final Talker _talker;

  QuranRemoteDataSourceImpl(
      this._apiClient,
      this._talker,
      );

  @override
  Future<QuranListResponseModel> getSurahList() async {
    try {
      _talker.debug('📖 Fetching surah list from Equran API...');

      final response = await _apiClient.getSurahList();

      if (response.code == 200) {
        _talker.info(
          '✅ Successfully fetched ${response.data.length} surahs',
        );
      } else {
        _talker.warning(
          '⚠️ Unexpected response code: ${response.code}',
        );
      }

      return response;
    } catch (e, stackTrace) {
      _talker.error(
        '❌ Error fetching surah list',
        e,
        stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<QuranDetailResponseModel> getSurahById(int id) async {
    try {
      _talker.debug('📖 Fetching ayah from Equran API...');

      final response = await _apiClient.getSurahById(id);

      if (response.code == 200) {
        _talker.info(
          '✅ Successfully fetched ${response.data} ayah',
        );
      } else {
        _talker.warning(
          '⚠️ Unexpected response code: ${response.code}',
        );
      }

      return response;
    } catch (e, stackTrace) {
      _talker.error(
        '❌ Error fetching ayah',
        e,
        stackTrace,
      );
      rethrow;
    }
  }

}