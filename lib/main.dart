import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'src/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const App());
}

/// client id:
/// 903487108269-fdkbpr6frqc3q7f54mna0s7gfggs1aar.apps.googleusercontent.com

/// use it with flutter v3.32 and above
/// --web-experimental-hot-reload
