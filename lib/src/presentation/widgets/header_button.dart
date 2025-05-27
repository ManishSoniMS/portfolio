import 'package:flutter/material.dart';

import '../../core/utils/extensions/on_build_context.dart';

class HeaderButton extends StatefulWidget {
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
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  bool hasHover = false;
  @override
  Widget build(BuildContext context) {
    final style = widget.textStyle ?? context.textTheme.bodySmall;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        FocusableActionDetector(
          onShowHoverHighlight: (hover) {
            setState(() => hasHover = hover);
          },
          child: TextButton(
            onPressed: widget.onTap,

            child: RichText(
              text: TextSpan(
                text: widget.icon,
                style: style?.copyWith(
                  fontSize: hasHover ? style.fontSize! + 2 : null,
                  color: context.colors.primary,
                ),
                children: [
                  TextSpan(
                    text: widget.text,
                    style: style?.copyWith(
                      fontSize: hasHover ? style.fontSize! + 2 : null,
                      color: widget.isSelected
                          ? context.colors.onSurface
                          : context.theme.disabledColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.hasDivider)
          Expanded(child: Container(height: 1, color: context.colors.primary)),
      ],
    );
  }
}
