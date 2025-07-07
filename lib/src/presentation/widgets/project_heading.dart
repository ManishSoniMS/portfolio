import 'package:flutter/material.dart';

import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import 'header_button.dart';

class ProjectHeading extends StatelessWidget {
  const ProjectHeading({super.key, required this.onTapViewAll});

  final VoidCallback onTapViewAll;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstraints.contentPadding(constraints.maxWidth),
          ),
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
                  child: AnimatedTextButton(
                      onTapViewAll: onTapViewAll, text: "View all ~~>"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AnimatedTextButton extends StatefulWidget {
  const AnimatedTextButton({
    super.key,
    required this.onTapViewAll,
    required this.text,
  });

  final VoidCallback onTapViewAll;
  final String text;

  @override
  State<AnimatedTextButton> createState() => _AnimatedTextButtonState();
}

class _AnimatedTextButtonState extends State<AnimatedTextButton> {
  bool hasHover = false;
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (hover) {
        setState(() => hasHover = hover);
      },
      child: TextButton(
        onPressed: widget.onTapViewAll,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: hasHover ? 16 : null,
            color: hasHover ? context.colors.primary : null,
          ),
        ),
      ),
    );
  }
}
