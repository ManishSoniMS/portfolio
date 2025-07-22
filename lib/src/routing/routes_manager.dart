import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/analytics/analytics.dart';
import '../presentation/pages/about_me_page.dart';
import '../presentation/pages/contact_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/works_page.dart';
import '../presentation/widgets/portfolio_navigation_shell.dart';

class RoutesManager {
  RoutesManager._() {
    router = GoRouter(
      observers: kDebugMode ? [] : [Analytics.instance.observer],
      routes: [
        GoRoute(
          path: '/',
          name: "Splash",
          builder: (context, state) => const SplashPage(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, _, navigationShell) =>
              PortfolioNavigationShell(navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home',
                  name: "Home",
                  builder: (context, state) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/work',
                  name: "Projects",
                  builder: (context, state) => const WorksPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/about-me',
                  name: "About me",
                  builder: (context, state) => const AboutMePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/contact',
                  name: "Contact",
                  builder: (context, state) => const ContactsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static RoutesManager get instance => RoutesManager._();

  late GoRouter router;
}
