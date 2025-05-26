import 'package:flutter/material.dart';

import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import 'header_button.dart';

class ProjectHeading extends StatelessWidget {
  const ProjectHeading({super.key});

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
                  child: TextButton(
                    onPressed: () {},
                    child: Text("View all ~~>"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
