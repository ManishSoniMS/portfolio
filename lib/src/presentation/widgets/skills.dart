import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../core/utils/functions/list_to_string.dart';
import 'decoration_rectangle.dart';
import 'portfolio_header.dart';
import 'tile_divider.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              SkillsGraphic(),
            ],
          ),
        ),
        Gap(AppConstraints.extraLarge),
        Padding(
          padding: EdgeInsets.only(top: AppConstraints.extraLarge * 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SkillBox(
                title: "Language & Framework",
                skills: ["Dart", "Flutter", "TypeScript"],
              ),
              Gap(AppConstraints.medium),
              Column(
                children: [
                  SkillBox(
                    title: "Architecture & Patterns",
                    skills: [
                      "Clean Architecture",
                      "BLoC",
                      "Cubit",
                      "Provider",
                      "MVVM",
                      "Freezed",
                    ],
                  ),
                  Gap(AppConstraints.medium),
                  SkillBox(
                    title: "Realtime & Networking",
                    skills: [
                      "Firebase Firestore",
                      "Realtime Database",
                      "Streams",
                      "REST APIs",
                      "WebSockets",
                    ],
                  ),
                ],
              ),
              Gap(AppConstraints.medium),
              Column(
                children: [
                  SkillBox(
                    title: "Database & Backend",
                    skills: [
                      "Firebase",
                      "Supabase",
                      "SQLite",
                      "Firebase Cloud Functions",
                    ],
                  ),
                  Gap(AppConstraints.medium),
                  SkillBox(
                    title: "Testing",
                    skills: [
                      "Unit Tests",
                      "Widget Tests",
                      "Integration Tests",
                      "BLoC Tests",
                    ],
                  ),
                  Gap(AppConstraints.medium),
                  SkillBox(
                    title: "Tools & DevOps",
                    skills: ["Git", "GitHub", "GitLab", "Bitrise (CI/CD)"],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SkillsGraphic extends StatelessWidget {
  const SkillsGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          left: 0,
          child: SvgPicture.asset(Assets.images.dots, height: 94, width: 94),
        ),
        Positioned(
          bottom: 100,
          left: 100,
          right: 70,
          child: SvgPicture.asset(Assets.images.dots, height: 94, width: 94),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: SvgPicture.asset(
            Assets.images.logoOutline,
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
  const SkillBox({super.key, required this.title, required this.skills});

  final String title;
  final List<String> skills;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178,
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
