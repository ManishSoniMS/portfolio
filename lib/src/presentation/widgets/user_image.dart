import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 368,
          // width: 350,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  Assets.icons.logoOutline,
                  height: 155,
                  width: 155,
                ),
              ),
              Positioned(
                child: Image.asset(Assets.images.user.path, width: 350),
              ),
              Positioned(
                bottom: 70,
                right: 20,
                child: SvgPicture.asset(
                  Assets.icons.dots,
                  height: 84,
                  width: 84,
                ),
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: AppConstraints.maxMobileWidth),
          padding: EdgeInsets.symmetric(
            horizontal: AppConstraints.small,
            vertical: AppConstraints.small / 2,
          ),
          // constraints: BoxConstraints(minWidth: 350),
          decoration: BoxDecoration(
            border: Border.all(color: context.theme.disabledColor, width: 1),
          ),
          child: Row(
            children: [
              Container(
                height: AppConstraints.medium,
                width: AppConstraints.medium,
                color: context.colors.primary,
              ),
              Gap(AppConstraints.small),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    text: "Currently working at ",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.theme.disabledColor,
                    ),
                    children: [
                      TextSpan(
                        text: "Beesolver Technology Pvt. Ltd.",
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
