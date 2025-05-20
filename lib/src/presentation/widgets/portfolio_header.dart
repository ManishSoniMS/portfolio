import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.images.logo, height: 16, width: 16),
        Gap(AppConstraints.small),
        Text("Manish", style: context.textTheme.bodyLarge),
        Spacer(),
        HeaderButton(onTap: () {}, text: "home", isSelected: true),
        HeaderButton(onTap: () {}, text: "works", isSelected: false),
        HeaderButton(onTap: () {}, text: "about-me", isSelected: false),
        HeaderButton(onTap: () {}, text: "contacts", isSelected: false),
      ],
    );
  }
}

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    super.key,
    this.onTap,
    this.icon = "#",
    required this.text,
    this.isSelected = true,
    this.textStyle,
    this.hasDivider = false,
  });

  final VoidCallback? onTap;
  final String icon;
  final String text;
  final bool isSelected;
  final TextStyle? textStyle;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          onPressed: onTap,
          child: RichText(
            text: TextSpan(
              text: icon,
              style: (textStyle ?? context.textTheme.bodySmall)?.copyWith(
                color: context.colors.primary,
              ),
              children: [
                TextSpan(
                  text: text,
                  style: (textStyle ?? context.textTheme.bodySmall)?.copyWith(
                    color:
                        isSelected
                            ? context.colors.onSurface
                            : context.theme.disabledColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasDivider)
          Expanded(child: Container(height: 1, color: context.colors.primary)),
      ],
    );
  }
}
