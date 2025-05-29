import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../routing/app_routes.dart';
import 'about_me_image.dart';
import 'decoration_rectangle.dart';
import 'header_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= AppConstraints.maxMobileWidth;
        return Stack(
          children: [
            Positioned(
              bottom: 150,
              right: -(104 * 0.2),
              child: SvgPicture.asset(
                Assets.icons.dots,
                height: 104,
                width: 104,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: -(156 / 2),
              child: Center(
                child: DecorationRectangle(
                  shape: DecorationRectangleShape.square,
                  dimension: 156,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstraints.contentPadding(constraints.maxWidth),
              ),
              child: isMobile
                  ? Column(
                      children: [
                        AboutMeDescription(
                          showReadMoreButton: true,
                          onReadMore: () => context.go(AppRoutes.aboutMe),
                        ),
                        Gap(AppConstraints.extraLarge),
                        AboutMeImage(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AboutMeDescription(
                            showReadMoreButton: true,
                            onReadMore: () => context.go(AppRoutes.aboutMe),
                          ),
                        ),
                        Gap(AppConstraints.extraLarge),
                        AboutMeImage(),
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }
}

class AboutMeDescription extends StatelessWidget {
  const AboutMeDescription({
    super.key,
    required this.showReadMoreButton,
    this.onReadMore,
  }) : assert(
         !showReadMoreButton || onReadMore != null,
         "If showReadMoreButton is true, please provide a VoidCallback for onReadMore.",
       );

  final bool showReadMoreButton;
  final VoidCallback? onReadMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        if (showReadMoreButton) ...[
          Gap(AppConstraints.large),
          OutlinedButton(onPressed: onReadMore, child: Text("Read more ~>")),
        ],
      ],
    );
  }
}
