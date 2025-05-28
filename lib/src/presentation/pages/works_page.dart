import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../domain/entities/project_entity.dart';
import '../widgets/decoration_rectangle.dart';
import '../widgets/header_button.dart';
import '../widgets/portfolio_footer.dart';
import '../widgets/project_tile.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstraints.contentPadding(
                      constraints.maxWidth,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderButton(
                        text: "Projects",
                        icon: "/",
                        textStyle: context.textTheme.headlineMedium,
                        hasDivider: false,
                      ),
                      Gap(AppConstraints.medium),
                      Text(
                        "List of my projects",
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              },
            ),
            Gap(AppConstraints.extraLarge * 2),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 30,
                  left: 30,
                  child: SvgPicture.asset(
                    Assets.icons.dots,
                    height: 59,
                    width: 159,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: -30,
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.icons.dots,
                      height: 103,
                      width: 103,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  right: -155 / 2,
                  child: Center(
                    child: DecorationRectangle(
                      dimension: 155,
                      shape: DecorationRectangleShape.square,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: -10,
                  child: Center(
                    child: DecorationRectangle(
                      dimension: 155,
                      shape: DecorationRectangleShape.square,
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isLargeMobile =
                        constraints.maxWidth <= AppConstraints.maxMobileWidth;

                    int maxLength = isLargeMobile ? 2 : 3;
                    int length = projects.length;
                    double horizontalPadding = AppConstraints.contentPadding(
                      constraints.maxWidth,
                    );

                    final tileWidth =
                        ((constraints.maxWidth - (horizontalPadding * 2)) /
                            maxLength) -
                        AppConstraints.medium;

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),

                      child: Wrap(
                        children: [
                          for (var i = 0; i < length; i++) ...[
                            ProjectTile(projects[i], width: tileWidth),
                            if ((i + 1) != length)
                              SizedBox(width: AppConstraints.medium),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            Gap(AppConstraints.extraLarge * 2),
            PortfolioFooter(),
          ],
        ),
      ),
    );
  }
}
