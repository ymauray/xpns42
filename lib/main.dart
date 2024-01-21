import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpns42/app.dart';
import 'package:xpns42/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final locale = await findSystemLocale();
  await initializeDateFormatting(locale);

  if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    final analytics = FirebaseAnalytics.instance;
    await analytics.logAppOpen();
  }

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );

  await FirebaseAuth.instance.signInAnonymously();

  final sharedPrefs = await SharedPreferences.getInstance();
  final showOnboardingSeen = sharedPrefs.getBool('onboarding_seen') ?? false;

  await Future<void>.delayed(const Duration(seconds: 5));

  runApp(ProviderScope(child: App(onboardingSeen: showOnboardingSeen)));
}
