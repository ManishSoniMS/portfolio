import 'package:go_router/go_router.dart';

import '../presentation/pages/about_me_page.dart';
import '../presentation/pages/contact_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/works_page.dart';
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
          builder: (context, _, navigationShell) =>
              PortfolioNavigationShell(navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home',
                  name: "Home",
                  builder: (context, state) => HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/work',
                  name: "Projects",
                  builder: (context, state) => WorksPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/about-me',
                  name: "About me",
                  builder: (context, state) => AboutMePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/contact',
                  name: "Contact",
                  builder: (context, state) => ContactsPage(),
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
