import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          child: SvgPicture.asset(Assets.images.dots, height: 84, width: 84),
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
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 171),
          shrinkWrap: true,
          itemCount: projects.length > 3 ? 3 : projects.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 3,
            crossAxisSpacing: AppConstraints.medium,
          ),
          itemBuilder: (context, index) {
            return ProjectTile(projects[index]);
          },
        ),
      ],
    );
  }
}
