import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

@module
abstract class LoggerModule {
  @lazySingleton
  Talker talker() {
    return Talker(
      settings: TalkerSettings(
        enabled: true,
        useConsoleLogs: kDebugMode,
      ),
      logger: TalkerLogger(
        settings: TalkerLoggerSettings(
          level: kDebugMode ? LogLevel.debug : LogLevel.error,
        ),
      ),
    );
  }}