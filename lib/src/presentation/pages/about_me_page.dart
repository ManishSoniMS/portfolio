import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../domain/entities/skill_entity.dart';
import '../widgets/about_me_image.dart';
import '../widgets/decoration_rectangle.dart';
import '../widgets/header_button.dart';
import '../widgets/portfolio_footer.dart';
import '../widgets/skills.dart';

String get calculatedExperience {
  final startedDate = DateTime(2021, 7, 1);
  final today = DateTime.now();

  final experienceInMonth = today.difference(startedDate).inDays ~/ 30;

  final experienceInYears = experienceInMonth / 12;

  final experience = experienceInYears.toStringAsFixed(1);
  return experience;
}

List<String> facts = [
  'Flutter dev with $calculatedExperience+ years of hands-on experience.',
  'I build fast, clean, cross-platform apps.',
  'Love working with BLoC, Provider, and clean code.',
  'Real-time updates? Firebase is my go-to.',
  'Payments? Done it with Stripe and Razorpay.',
  'CI/CD? Bitrise keeps my builds smooth.',
  'I’m also an artist—portraits are my thing.',
  'I run two art pages full of sketches and studies.',
  'Art helps me slow down. Code keeps me sharp.',
  'I create stuff that looks good and works better.',
];

String aboutMeText = "Hey! I’m Manish —\n\n"
    "A passionate Flutter developer with $calculatedExperience+ "
    "years of experience building high-performance, visually polished apps for "
    "mobile and web. I specialize in turning complex ideas "
    "into smooth, scalable solutions using Flutter, Firebase, "
    "and REST APIs. From crafting pixel-perfect UIs to "
    "automating workflows with CI/CD, I bring precision, "
    "creativity, and a user-first mindset to every project.\n\n"
    "When I’m not coding, I’m exploring the latest in the "
    "Flutter ecosystem or geeking out over performance "
    "optimization. \n\n"
    "Tech is my craft, creativity is my fuel — and I "
    "love building experiences that make both shine.";

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile =
                constraints.maxWidth <= AppConstraints.maxMobileWidth;
            double skillBoxWidth = getTileWidth(constraints.maxWidth);
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 300,
                      left: 30,
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.icons.dots,
                          height: 49,
                          width: 103,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 600,
                      right: -103 / 2,
                      child: SvgPicture.asset(
                        Assets.icons.dots,
                        height: 103,
                        width: 103,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -103 / 3,
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
                    const Positioned(
                      top: 50,
                      right: -155 / 2,
                      child: Center(
                        child: DecorationRectangle(
                          dimension: 155,
                          shape: DecorationRectangleShape.square,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 100,
                      left: -155 / 2,
                      child: Center(
                        child: DecorationRectangle(
                          dimension: 155,
                          shape: DecorationRectangleShape.square,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstraints.contentPadding(
                          constraints.maxWidth,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderButton(
                                text: "about-me",
                                icon: "/",
                                textStyle: context.textTheme.headlineMedium,
                                hasDivider: false,
                              ),
                              const Gap(AppConstraints.medium),
                              Text(
                                "Who am i?",
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const Gap(AppConstraints.medium),
                          _aboutMeSection(context, isMobile: isMobile),
                          const Gap(AppConstraints.extraLarge * 2),
                          HeaderButton(
                            text: "skills",
                            icon: "/",
                            textStyle: context.textTheme.headlineMedium,
                            hasDivider: false,
                          ),
                          const Gap(AppConstraints.medium),
                          Wrap(
                            alignment: WrapAlignment.end,
                            children: [
                              for (var i = 0; i < skills.length; i++)
                                Padding(
                                  padding: const EdgeInsets.all(
                                      AppConstraints.small),
                                  child: SkillBox(
                                    title: skills[i].title,
                                    skills: skills[i].skills,
                                    width: skillBoxWidth,
                                  ),
                                ),
                            ],
                          ),
                          const Gap(AppConstraints.extraLarge * 2),
                          HeaderButton(
                            text: "my-fun-facts",
                            icon: "/",
                            textStyle: context.textTheme.headlineMedium,
                            hasDivider: false,
                          ),
                          const Gap(AppConstraints.medium),
                          _myFunFacts(context, isMobile: isMobile),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(AppConstraints.extraLarge * 4),
                const PortfolioFooter(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _myFunFacts(BuildContext context, {required bool isMobile}) {
    if (isMobile) {
      return Wrap(
        alignment: WrapAlignment.start,
        children: [
          for (var i = 0; i < facts.length; i++)
            Container(
              margin: const EdgeInsets.all(AppConstraints.small),
              padding: const EdgeInsets.all(AppConstraints.small),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.theme.disabledColor,
                  width: 1,
                ),
              ),
              child: Text(
                facts[i],
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
            ),
        ],
      );
    }
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              for (var i = 0; i < facts.length; i++)
                Container(
                  margin: const EdgeInsets.all(AppConstraints.small),
                  padding: const EdgeInsets.all(AppConstraints.small),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.theme.disabledColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    facts[i],
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.theme.disabledColor,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              const Center(child: SizedBox.square(dimension: 200)),
              Positioned(
                top: 0,
                left: 0,
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
                bottom: 0,
                right: 0,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.icons.logoOutline,
                    height: 103,
                    width: 103,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double getTileWidth(double size) {
    if (size >= AppConstraints.maxDesktopWidth) {
      return ((size - (AppConstraints.contentPadding(size) * 2)) -
              (AppConstraints.medium * 6)) /
          6;
    }
    if (size >= AppConstraints.minDesktopWidth) {
      return ((size - (AppConstraints.contentPadding(size) * 2)) -
              (AppConstraints.medium * 4)) /
          4;
    }
    if (size >= AppConstraints.maxMobileWidth) {
      return ((size - (AppConstraints.contentPadding(size) * 2)) -
              (AppConstraints.medium * 2)) /
          2;
    }
    return 200;
  }

  Widget _aboutMeSection(BuildContext context, {required bool isMobile}) {
    return isMobile
        ? Column(
            children: [
              Text(
                aboutMeText,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
              const Gap(AppConstraints.extraLarge),
              const AboutMeImage(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  aboutMeText,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.disabledColor,
                  ),
                ),
              ),
              const Gap(AppConstraints.extraLarge),
              const AboutMeImage(),
            ],
          );
  }
}
