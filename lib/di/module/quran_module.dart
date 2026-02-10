import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:tumbuh_iman/data/remote/quran/quran_remote_data_source.dart';
import 'package:tumbuh_iman/data/repositories/quran/quran_repository_impl.dart';
import 'package:tumbuh_iman/domain/repositories/quran/quran_repository.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case.dart';
import 'package:tumbuh_iman/usecase/quran/get_quran_use_case_impl.dart';

@module
abstract class QuranModule {
  // Define Quran-specific third-party dependencies here
  @lazySingleton
  QuranRepository provideQuranRepository(QuranRemoteDataSource remoteDataSource, Talker talker) {
    return QuranRepositoryImpl(remoteDataSource, talker);
  }
  @lazySingleton
  GetQuranUseCase provideQuranUseCase(QuranRepository repository) {
    return GetQuranUseCaseImpl(repository);
  }
}