import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../core/constants/app_constraints.dart';
import '../../domain/entities/project_entity.dart';
import 'decoration_rectangle.dart';
import 'project_tile.dart';

class ViewLessProjects extends StatelessWidget {
  const ViewLessProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          left: -(84 * 0.67),
          child: SvgPicture.asset(Assets.icons.dots, height: 84, width: 84),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: -(155 * 0.67),
          child: Center(
            child: DecorationRectangle(
              dimension: 155,
              shape: DecorationRectangleShape.square,
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            bool isLargeMobile =
                constraints.maxWidth <= AppConstraints.maxMobileWidth;

            int maxLength = isLargeMobile ? 2 : 3;

            double horizontalPadding = AppConstraints.contentPadding(
              constraints.maxWidth,
            );

            final tileWidth =
                ((constraints.maxWidth - (horizontalPadding * 2)) / maxLength) -
                AppConstraints.medium;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < maxLength; i++) ...[
                    ProjectTile(projects[i], width: tileWidth),
                    if ((i + 1) != maxLength) Gap(AppConstraints.medium),
                  ],
                ],
              ),
            );

            // return GridView.builder(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: isLargeMobile ? AppConstraints.medium : 171,
            //   ),
            //   shrinkWrap: true,
            //   itemCount:
            //       projects.length > maxLength ? maxLength : projects.length,
            //   physics: NeverScrollableScrollPhysics(),
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     childAspectRatio:
            //         isSmallMobile
            //             ? 0.25
            //             : isMediumMobile
            //             ? 0.34
            //             : isLargeMobile
            //             ? 0.4
            //             : 0.6,
            //     crossAxisCount: isLargeMobile ? 2 : 3,
            //     crossAxisSpacing: AppConstraints.medium,
            //   ),
            //   itemBuilder: (context, index) {
            //     return ProjectTile(projects[index]);
            //   },
            // );
          },
        ),
      ],
    );
  }
}
