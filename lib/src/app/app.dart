import 'package:flutter/material.dart';

import '../core/theme/theme.dart';
import '../routing/routes_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      theme: DefaultTheme.instance.darkTheme,
      darkTheme: DefaultTheme.instance.darkTheme,
      routerConfig: RoutesManager.instance.router,
    );
  }
}
