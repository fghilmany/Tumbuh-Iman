import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:tumbuh_iman/firebase_options.dart';

/// Firebase dependency injection module
/// Provides Firebase Core and Crashlytics instances
@module
abstract class FirebaseModule {
  @preResolve
  @lazySingleton
  Future<FirebaseApp> get firebaseApp => Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

  @lazySingleton
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;
}
