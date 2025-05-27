import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../core/utils/functions/list_to_string.dart';
import '../../domain/entities/project_entity.dart';
import 'tile_divider.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile(this.project, {super.key, required this.width});

  final ProjectEntity project;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstraints.medium),
      constraints: BoxConstraints(maxWidth: max(width, 250)),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.disabledColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(1).copyWith(bottom: 0),
            child: AspectRatio(
              aspectRatio: 1.6,
              child: CachedNetworkImage(
                imageUrl: project.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (_, _, _) => Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          TileDivider(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstraints.medium,
              vertical: AppConstraints.small,
            ),
            child: Text(
              listToString(project.techStack),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.theme.disabledColor,
              ),
            ),
          ),
          TileDivider(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstraints.medium,
              vertical: AppConstraints.medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.name, style: context.textTheme.titleLarge),
                Gap(AppConstraints.small),
                Text(
                  project.shortDescription,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.disabledColor,
                  ),
                ),
                if (project.isPublished) ...[
                  Gap(AppConstraints.medium),
                  OutlinedButton(onPressed: () {}, child: Text("Live <~>")),
                ] else
                  Gap(AppConstraints.small),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
