import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/constants/links.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../core/utils/functions/open_link.dart';
import 'svg_icon_button.dart';
import 'tile_divider.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= AppConstraints.maxMobileWidth;
        return Column(
          children: [
            const TileDivider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstraints.contentPadding(constraints.maxWidth),
                vertical: AppConstraints.extraLarge,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.icons.logo,
                              height: 16,
                              width: 16,
                            ),
                            const Gap(AppConstraints.small),
                            Text("Manish", style: context.textTheme.bodyMedium),
                          ],
                        ),
                        const Gap(AppConstraints.medium),
                        Text(
                          "Cross-platform Mobile Application Developer",
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: isMobile ? 3 : 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Media", style: context.textTheme.titleLarge),
                        const Gap(AppConstraints.small * 1.5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgIconButton(
                              onTap: () => openLink(linkedin),
                              icon: Assets.icons.linkedin,
                            ),
                            const Gap(AppConstraints.medium),
                            SvgIconButton(
                              onTap: () => openLink(github),
                              icon: Assets.icons.github,
                            ),
                            const Gap(AppConstraints.medium),
                            SvgIconButton(
                              onTap: () => openLink(instagram),
                              icon: Assets.icons.instagram,
                            ),
                            const Gap(AppConstraints.medium),
                            SvgIconButton(
                              onTap: () => openLink(youtube),
                              icon: Assets.icons.youtube,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(53),
          ],
        );
      },
    );
  }
}
