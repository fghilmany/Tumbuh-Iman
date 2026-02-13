import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/data/local/quran/quran_local_data_source.dart';
import 'package:tumbuh_iman/data/local/quran/quran_local_data_source_impl.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_api_client.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_remote_data_source.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_remote_data_source_impl.dart';
import 'package:tumbuh_iman/data/repositories/quran/quran_repository_impl.dart';
import 'package:tumbuh_iman/data/repositories/quran/quran_store_caching_decorator.dart';
import 'package:tumbuh_iman/domain/repositories/quran/quran_repository.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case_impl.dart';

import '../../data/local/database/app_database.dart';

@module
abstract class QuranModule {
  // Define Quran-specific third-party dependencies here
  @lazySingleton
  GetQuranUseCase provideQuranUseCase(QuranRepository repository) {
    return GetQuranUseCaseImpl(repository);
  }

  @lazySingleton
  QuranRemoteDataSource provideQuranRemoteDataSource(
    QuranApiClient client,
    Talker talker,
  ) {
    return QuranRemoteDataSourceImpl(client, talker);
  }

  @lazySingleton
  QuranLocalDataSource provideQuranLocalDataSource(
    AppDatabase database,
    Talker talker,
  ) {
    return QuranLocalDataSourceImpl(database, talker);
  }

  @lazySingleton
  QuranRepository provideQuranRepositoryWithLocal(
    QuranRemoteDataSource remoteDataSource,
    QuranLocalDataSource localDataSource,
    Talker talker,
  ) {
    return QuranStoreCachingDecorator(
      localDataSource: localDataSource,
      wrapped: QuranRepositoryImpl(remoteDataSource, talker),
    );
  }
}
