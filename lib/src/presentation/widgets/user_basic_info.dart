import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import 'user_image.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= AppConstraints.minDesktopWidth;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstraints.contentPadding(constraints.maxWidth),
          ),
          child: isMobile
              ? Column(
                  children: const [
                    UserBasicInfo(),
                    Gap(AppConstraints.large),
                    UserImage(),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Expanded(child: UserBasicInfo()),
                    Gap(AppConstraints.large),
                    UserImage(),
                  ],
                ),
        );
      },
    );
  }
}

class UserBasicInfo extends StatelessWidget {
  const UserBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Manish is a ",
            style: context.textTheme.headlineLarge,
            children: [
              TextSpan(
                text: "Flutter Mobile App Developer",
                style: context.textTheme.headlineLarge?.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ],
          ),
        ),
        Gap(AppConstraints.extraLarge),
        Text(
          "I build high-performance Flutter apps with clean code, "
          "real-time data integration, "
          "and seamless CI/CD — optimized for both mobile and web.",
          style: context.textTheme.bodySmall?.copyWith(
            color: context.theme.disabledColor,
          ),
        ),
        Gap(AppConstraints.large),
        OutlinedButton(onPressed: () {}, child: Text("Contact me!!")),
      ],
    );
  }
}
