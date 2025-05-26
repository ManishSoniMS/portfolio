import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import 'decoration_rectangle.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstraints.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _container(
                      context,
                      padding: AppConstraints.extraLarge,
                      child: Text(
                        "First, solve the problem. Then, write the code.",
                        style: context.textTheme.titleLarge,
                      ),
                    ),
                    Positioned(
                      top: -AppConstraints.large,
                      left: AppConstraints.extraLarge,
                      child: comma(context),
                    ),
                    Positioned(
                      bottom: -AppConstraints.large,
                      right: AppConstraints.extraLarge,
                      child: comma(context),
                    ),
                  ],
                ),
                _container(
                  context,
                  hideTop: true,
                  child: Text(
                    "– John Johnson",
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: DecorationRectangle(
              dimension: 91,
              onRight: true,
              shape: DecorationRectangleShape.square,
            ),
          ),
        ),
      ],
    );
  }

  Widget comma(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstraints.medium),
      decoration: BoxDecoration(color: context.theme.scaffoldBackgroundColor),
      child: SvgPicture.asset(
        Assets.icons.doubleQuote,
        width: AppConstraints.large,
      ),
    );
  }

  Widget _container(
    BuildContext context, {
    double padding = AppConstraints.medium,
    required Widget child,
    bool hideTop = false,
  }) {
    final side = BorderSide(width: 1, color: context.theme.disabledColor);
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border(
          top: hideTop ? BorderSide.none : side,
          bottom: side,
          left: side,
          right: side,
        ),
      ),
      child: child,
    );
  }
}
