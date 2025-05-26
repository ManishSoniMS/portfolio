import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import 'header_button.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= AppConstraints.maxMobileWidth;
        return Stack(
          children: [
            if (!isMobile)
              Positioned(
                top: 0,
                bottom: 0,
                left: -(104 / 2),
                child: SvgPicture.asset(
                  Assets.icons.dots,
                  height: 104,
                  width: 104,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstraints.contentPadding(constraints.maxWidth),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isMobile) Gap(AppConstraints.extraLarge),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : size.width * 0.3,
                    ),
                    child: HeaderButton(
                      text: "contacts",
                      textStyle: context.textTheme.headlineMedium,
                      hasDivider: true,
                    ),
                  ),
                  Gap(AppConstraints.extraLarge),
                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I’m interested in freelance opportunities. "
                              "However, if you have other request or question, "
                              "don’t hesitate to contact me.",
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.theme.disabledColor,
                              ),
                            ),
                            Gap(AppConstraints.extraLarge),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: MessageMeHere(),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: size.width * 0.3,
                              ),
                              child: Text(
                                "I’m interested in freelance opportunities. "
                                "However, if you have other request or question, "
                                "don’t hesitate to contact me.",
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context.theme.disabledColor,
                                ),
                              ),
                            ),
                            Gap(AppConstraints.extraLarge),
                            Spacer(),
                            MessageMeHere(),
                          ],
                        ),
                  Gap(isMobile ? AppConstraints.extraLarge : 106),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class MessageMeHere extends StatelessWidget {
  const MessageMeHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstraints.medium),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.disabledColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Message me here", style: context.textTheme.bodySmall),
          Gap(AppConstraints.medium),
          ContactInfo(
            icon: Assets.icons.mail,
            contactInfo: "imsonimanish@gmail.com",
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key, required this.icon, required this.contactInfo});

  final String icon;
  final String contactInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          height: AppConstraints.medium,
          width: AppConstraints.medium,
        ),
        Gap(AppConstraints.small),
        Text(
          contactInfo,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.theme.disabledColor,
          ),
        ),
      ],
    );
  }
}
