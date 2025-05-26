import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.size = AppConstraints.large,
    this.color,
  });

  final VoidCallback onTap;
  final String icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        height: size,
        width: size,
        colorFilter: ColorFilter.mode(
          color ?? context.theme.disabledColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
