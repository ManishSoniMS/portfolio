import 'package:go_router/go_router.dart';

import '../presentation/pages/about_me_page.dart';
import '../presentation/pages/contact_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/work_page.dart';
import '../presentation/widgets/portfolio_navigation_shell.dart';

class RoutesManager {
  RoutesManager._() {
    router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: "Splash",
          builder: (context, state) => SplashPage(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              PortfolioNavigationShell(navigationShell),
          branches: [
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/home',
                  name: "Home",
                  builder: (context, state) => HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/work',
                  name: "Work",
                  builder: (context, state) => WorkPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/about-me',
                  name: "About",
                  builder: (context, state) => AboutMePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/contact',
                  name: "Contact",
                  builder: (context, state) => ContactPage(),
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
