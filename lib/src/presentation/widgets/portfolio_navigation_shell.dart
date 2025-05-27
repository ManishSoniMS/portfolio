import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../routing/app_routes.dart';
import 'header_button.dart';
import 'svg_icon_button.dart';

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

class PortfolioHeader extends StatelessWidget implements PreferredSizeWidget {
  const PortfolioHeader({super.key, this.currentIndex = 0});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < AppConstraints.minDesktopWidth;
        return AppBar(
          centerTitle: false,
          surfaceTintColor: context.colors.surface,
          automaticallyImplyLeading: false,
          leading: SizedBox(),
          leadingWidth: AppConstraints.contentPadding(constraints.maxWidth),
          title: _title(context),
          actions: [
            if (isMobile)
              SvgIconButton(onTap: () {}, icon: Assets.icons.drawer)
            else ...[
              HeaderButton(
                onTap: () => context.go(AppRoutes.home),
                text: "home",
                isSelected: currentIndex == 0,
              ),
              HeaderButton(
                onTap: () => context.go(AppRoutes.work),
                text: "works",
                isSelected: currentIndex == 1,
              ),
              HeaderButton(
                onTap: () => context.go(AppRoutes.aboutMe),
                text: "about-me",
                isSelected: currentIndex == 2,
              ),
              HeaderButton(
                onTap: () => context.go(AppRoutes.contact),
                text: "contacts",
                isSelected: currentIndex == 3,
              ),
            ],
            Gap(AppConstraints.contentPadding(constraints.maxWidth)),
          ],
        );
      },
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(Assets.icons.logo, height: 16, width: 16),
        Gap(AppConstraints.small),
        Text("Manish", style: context.textTheme.bodyLarge),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
