import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../widgets/portfolio_header.dart';
import '../widgets/quote.dart';
import '../widgets/skills.dart';
import '../widgets/tile_divider.dart';
import '../widgets/user_basic_info.dart';
import '../widgets/user_image.dart';
import '../widgets/view_less_projects.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 171),
              child: PortfolioHeader(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 171),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: const [
                  Expanded(child: UserBasicInfo()),
                  Gap(AppConstraints.large),
                  UserImage(),
                ],
              ),
            ),
          ),
          SliverGap(112),
          SliverToBoxAdapter(child: Quote()),
          SliverGap(72),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 171),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: HeaderButton(
                      text: "Projects",
                      textStyle: context.textTheme.headlineMedium,
                      hasDivider: true,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("View all ~~>"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGap(48),
          SliverToBoxAdapter(child: ViewLessProjects()),
          SliverGap(60),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 171),
            sliver: SliverToBoxAdapter(child: Skills()),
          ),
          SliverToBoxAdapter(child: AboutMe()),
          SliverGap(106),
          SliverToBoxAdapter(child: TileDivider()),
          SliverGap(106),
        ],
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              HeaderButton(
                text: "about-me",
                textStyle: context.textTheme.headlineMedium,
                hasDivider: true,
              ),
              Text(
                "Hey! I’m Manish — \n\na Flutter developer with 3.5+ years "
                "of experience building smooth, responsive apps "
                "for mobile and web. I love turning complex ideas "
                "into clean, scalable code using Flutter, "
                "Firebase, and REST APIs. Whether it’s designing "
                "pixel-perfect UIs or setting up CI/CD pipelines, "
                "I enjoy solving real-world problems with elegant tech. "
                "\n\nWhen I’m not coding, you’ll probably find me "
                "exploring new tools in the Flutter world or "
                "geeking out over performance optimization.",
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
            ],
          ),
        ),
        Gap(AppConstraints.extraLarge),
        Stack(
          children: [
            Image.asset(Assets.images.aboutMe.path, height: 507, width: 339),
            Positioned(
              top: 30,
              left: 0,
              child: SvgPicture.asset(
                Assets.images.dots,
                height: 84,
                width: 84,
              ),
            ),
            Positioned(
              top: 100,
              bottom: 50,
              right: 0,
              child: SvgPicture.asset(
                Assets.images.dots,
                height: 56,
                width: 104,
              ),
            ),
            Positioned(
              bottom: -1,
              left: 0,
              right: 0,
              child: Container(
                width: 339,
                height: 2,
                color: context.colors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
