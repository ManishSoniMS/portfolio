import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import 'svg_icon_button.dart';
import 'tile_divider.dart';

final String linkedin = "https://www.linkedin.com/in/ms110/";
final String github = "https://github.com/ManishSoniMS";
final String instagram = "https://www.instagram.com/manish.soni.art/";
final String youtube = "https://www.youtube.com/@ManishSoni-Art";

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= AppConstraints.maxMobileWidth;
        return Column(
          children: [
            TileDivider(),
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
                            Gap(AppConstraints.small),
                            Text("Manish", style: context.textTheme.bodyMedium),
                          ],
                        ),
                        Gap(AppConstraints.medium),
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
                        Gap(AppConstraints.small * 1.5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgIconButton(
                              onTap: () => _launchUrl(linkedin),
                              icon: Assets.icons.linkedin,
                            ),
                            Gap(AppConstraints.medium),
                            SvgIconButton(
                              onTap: () => _launchUrl(github),
                              icon: Assets.icons.github,
                            ),
                            Gap(AppConstraints.medium),
                            SvgIconButton(
                              onTap: () => _launchUrl(instagram),
                              icon: Assets.icons.instagram,
                            ),
                            Gap(AppConstraints.medium),
                            SvgIconButton(
                              onTap: () => _launchUrl(youtube),
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
            Gap(53),
          ],
        );
      },
    );
  }
}

Future<void> _launchUrl(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw Exception('Could not launch $uri');
  }
}
