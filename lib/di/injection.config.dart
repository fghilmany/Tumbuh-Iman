// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i141;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker/talker.dart' as _i993;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

import '../core/services/analytics_service.dart' as _i267;
import '../core/services/crashlytics_service.dart' as _i758;
import '../core/services/firebase_remote_config_service.dart' as _i307;
import '../core/services/translation_service.dart' as _i557;
import '../core/utils/error_handler.dart' as _i240;
import '../data/local/database/app_database.dart' as _i130;
import '../data/local/quran/quran_local_datasource.dart' as _i339;
import '../data/local/translation/translation_local_datasource.dart' as _i918;
import '../data/remote/dialy_habit/meal_nutrition_api_client.dart' as _i585;
import '../data/remote/prayer_times/prayer_times_api_client.dart' as _i1039;
import '../data/remote/quran/quran_api_client.dart' as _i80;
import '../data/remote/quran/quran_remote_data_source.dart' as _i552;
import '../data/remote/quran/quran_remote_data_source_impl.dart' as _i312;
import '../data/remote/translation/translation_remote_datasource.dart' as _i570;
import '../data/repositories/translation_repository_impl.dart' as _i892;
import '../domain/repositories/quran/quran_repository.dart' as _i336;
import '../domain/repositories/translation/translations_repositories.dart'
    as _i464;
import '../presentation/features/home/bloc/home_bloc.dart' as _i366;
import '../presentation/features/splash/bloc/splash_bloc.dart' as _i4;
import '../usecase/quran/get_quran_use_case.dart' as _i585;
import 'module/cache_module.dart' as _i693;
import 'module/database_module.dart' as _i484;
import 'module/firebase_module.dart' as _i343;
import 'module/logger_module.dart' as _i454;
import 'module/network_module.dart' as _i881;
import 'module/quran_module.dart' as _i978;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final cacheModule = _$CacheModule();
    final databaseModule = _$DatabaseModule();
    final firebaseModule = _$FirebaseModule();
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    final quranModule = _$QuranModule();
    gh.factory<_i366.HomeBloc>(() => _i366.HomeBloc());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => cacheModule.sharedPreferences,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i130.AppDatabase>(
      () => databaseModule.database(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i982.FirebaseApp>(
      () => firebaseModule.firebaseApp,
      preResolve: true,
    );
    gh.lazySingleton<_i141.FirebaseCrashlytics>(
      () => firebaseModule.crashlytics,
    );
    gh.lazySingleton<_i398.FirebaseAnalytics>(() => firebaseModule.analytics);
    gh.lazySingleton<_i398.FirebaseAnalyticsObserver>(
      () => firebaseModule.analyticsObserver,
    );
    gh.lazySingleton<_i627.FirebaseRemoteConfig>(
      () => firebaseModule.remoteConfig,
    );
    gh.lazySingleton<_i993.Talker>(() => loggerModule.talker());
    gh.factory<_i339.QuranLocalDataSource>(
      () => _i339.QuranLocalDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.singleton<_i307.FirebaseRemoteConfigService>(
      () => _i307.FirebaseRemoteConfigService(
        gh<_i627.FirebaseRemoteConfig>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.factory<_i918.TranslationLocalDataSource>(
      () => _i918.TranslationLocalDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.lazySingleton<_i267.AnalyticsService>(
      () => _i267.AnalyticsService(
        gh<_i398.FirebaseAnalytics>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.lazySingleton<_i758.CrashlyticsService>(
      () => _i758.CrashlyticsService(
        gh<_i141.FirebaseCrashlytics>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.factory<_i570.TranslationRemoteDataSource>(
      () => _i570.TranslationRemoteDataSourceImpl(
        gh<_i307.FirebaseRemoteConfigService>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.lazySingleton<_i240.ErrorHandler>(
      () => _i240.ErrorHandler(gh<_i758.CrashlyticsService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () =>
          networkModule.dio(gh<_i993.Talker>(), gh<_i758.CrashlyticsService>()),
    );
    gh.factory<_i464.TranslationRepository>(
      () => _i892.TranslationRepositoryImpl(
        gh<_i570.TranslationRemoteDataSource>(),
        gh<_i918.TranslationLocalDataSource>(),
        gh<_i307.FirebaseRemoteConfigService>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.lazySingleton<_i80.QuranApiClient>(
      () => networkModule.quranApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1039.PrayerTimesApiClient>(
      () => networkModule.prayerTimesApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i585.MealNutritionApiClient>(
      () => networkModule.mealNutritionApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i557.TranslationService>(
      () => _i557.TranslationService(
        gh<_i464.TranslationRepository>(),
        gh<_i307.FirebaseRemoteConfigService>(),
        gh<_i460.SharedPreferences>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.factory<_i552.QuranRemoteDataSource>(
      () => _i312.QuranRemoteDataSourceImpl(
        gh<_i80.QuranApiClient>(),
        gh<_i207.Talker>(),
      ),
    );
    gh.lazySingleton<_i336.QuranRepository>(
      () => quranModule.provideQuranRepository(
        gh<_i552.QuranRemoteDataSource>(),
        gh<_i993.Talker>(),
      ),
    );
    gh.lazySingleton<_i585.GetQuranUseCase>(
      () => quranModule.provideQuranUseCase(gh<_i336.QuranRepository>()),
    );
    gh.factory<_i4.SplashBloc>(
      () => _i4.SplashBloc(gh<_i585.GetQuranUseCase>(), gh<_i993.Talker>()),
    );
    return this;
  }
}

class _$CacheModule extends _i693.CacheModule {}

class _$DatabaseModule extends _i484.DatabaseModule {}

class _$FirebaseModule extends _i343.FirebaseModule {}

class _$LoggerModule extends _i454.LoggerModule {}

class _$NetworkModule extends _i881.NetworkModule {}

class _$QuranModule extends _i978.QuranModule {}
