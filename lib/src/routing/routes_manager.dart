import 'package:go_router/go_router.dart';

import '../presentation/pages/home_page.dart';

class RoutesManager {
  RoutesManager._() {
    router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: "home",
          builder: (context, state) => HomePage(),
        ),
      ],
    );
  }

  static RoutesManager get instance => RoutesManager._();

  late GoRouter router;
}
