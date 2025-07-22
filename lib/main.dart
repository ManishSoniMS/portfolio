import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'firebase_options.dart';
import 'src/app/app.dart';
import 'src/data/analytics/analytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  usePathUrlStrategy();

  if (kReleaseMode) {
    Analytics.instance;
  }

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  runApp(ProviderScope(child: App()));
}

/// client id:
/// 903487108269-fdkbpr6frqc3q7f54mna0s7gfggs1aar.apps.googleusercontent.com

/// use it with flutter v3.32 and above
/// --web-experimental-hot-reload
