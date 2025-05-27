import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../core/utils/functions/list_to_string.dart';
import '../../domain/entities/skill_entity.dart';
import 'decoration_rectangle.dart';
import 'header_button.dart';
import 'tile_divider.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeMobile =
            constraints.maxWidth <= (AppConstraints.maxMobileWidth * 1.6);

        double tileWidth = getTileWidth(constraints.maxWidth);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstraints.contentPadding(constraints.maxWidth),
          ),
          child: isLargeMobile
              ? Column(
                  children: [
                    HeaderButton(
                      text: "Skills",
                      textStyle: context.textTheme.headlineMedium,
                      hasDivider: true,
                    ),
                    Gap(AppConstraints.extraLarge),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SkillBox(
                              title: skills[0].title,
                              skills: skills[0].skills,
                              width: tileWidth,
                            ),
                            Gap(AppConstraints.medium),
                            SkillBox(
                              title: skills[2].title,
                              skills: skills[2].skills,
                              width: tileWidth,
                            ),
                            Gap(AppConstraints.medium),
                            SkillBox(
                              title: skills[4].title,
                              skills: skills[4].skills,
                              width: tileWidth,
                            ),
                          ],
                        ),
                        Gap(AppConstraints.medium),
                        Column(
                          children: [
                            SkillBox(
                              title: skills[1].title,
                              skills: skills[1].skills,
                              width: tileWidth,
                            ),
                            Gap(AppConstraints.medium),
                            SkillBox(
                              title: skills[3].title,
                              skills: skills[3].skills,
                              width: tileWidth,
                            ),
                            Gap(AppConstraints.medium),
                            SkillBox(
                              title: skills[5].title,
                              skills: skills[5].skills,
                              width: tileWidth,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          HeaderButton(
                            text: "Skills",
                            textStyle: context.textTheme.headlineMedium,
                            hasDivider: true,
                          ),
                          if (!isLargeMobile) SkillsGraphic(),
                        ],
                      ),
                    ),
                    Gap(AppConstraints.extraLarge),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppConstraints.extraLarge * 2,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkillBox(
                            title: skills[0].title,
                            skills: skills[0].skills,
                            width: tileWidth,
                          ),
                          Gap(AppConstraints.medium),
                          Column(
                            children: [
                              SkillBox(
                                title: skills[1].title,
                                skills: skills[1].skills,
                                width: tileWidth,
                              ),
                              Gap(AppConstraints.medium),
                              SkillBox(
                                title: skills[2].title,
                                skills: skills[2].skills,
                                width: tileWidth,
                              ),
                            ],
                          ),
                          Gap(AppConstraints.medium),
                          Column(
                            children: [
                              SkillBox(
                                title: skills[3].title,
                                skills: skills[3].skills,
                                width: tileWidth,
                              ),
                              Gap(AppConstraints.medium),
                              SkillBox(
                                title: skills[4].title,
                                skills: skills[4].skills,
                                width: tileWidth,
                              ),
                              Gap(AppConstraints.medium),
                              SkillBox(
                                title: skills[5].title,
                                skills: skills[5].skills,
                                width: tileWidth,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  double getTileWidth(double size) {
    if (size >= AppConstraints.maxDesktopWidth) {
      return 200;
    } else if (size >= AppConstraints.minDesktopWidth) {
      return 140;
    } else {
      return 120;
    }
  }
}

class SkillsGraphic extends StatelessWidget {
  const SkillsGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 30,
          left: 0,
          child: SvgPicture.asset(Assets.icons.dots, height: 94, width: 94),
        ),
        Positioned(
          bottom: 100,
          left: 100,
          right: 70,
          child: SvgPicture.asset(Assets.icons.dots, height: 94, width: 94),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: SvgPicture.asset(
            Assets.icons.logoOutline,
            height: 169,
            width: 169,
          ),
        ),
        Positioned(
          right: 50,
          top: 0,
          child: DecorationRectangle(
            shape: DecorationRectangleShape.square,
            dimension: 129,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 60,
          child: DecorationRectangle(
            shape: DecorationRectangleShape.square,
            dimension: 78,
          ),
        ),
        SizedBox(width: 453, height: 423),
      ],
    );
  }
}

class SkillBox extends StatelessWidget {
  const SkillBox({
    super.key,
    required this.title,
    required this.skills,
    required this.width,
  });

  final String title;
  final List<String> skills;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.disabledColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppConstraints.small),
            child: Text(title, style: context.textTheme.bodyLarge),
          ),
          TileDivider(),
          Padding(
            padding: EdgeInsets.all(AppConstraints.small),
            child: Text(
              listToString(skills),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.theme.disabledColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
