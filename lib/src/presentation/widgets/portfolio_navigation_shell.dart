import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'portfolio_header.dart';

class PortfolioNavigationShell extends StatelessWidget {
  const PortfolioNavigationShell(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioHeader(currentIndex: navigationShell.currentIndex),
      body: navigationShell,
    );
  }
}
