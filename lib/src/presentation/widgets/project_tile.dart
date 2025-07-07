import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../core/utils/functions/list_to_string.dart';
import '../../domain/entities/project_entity.dart';
import 'show_project_links_dialog_box.dart';
import 'tile_divider.dart';

class ProjectTile extends StatefulWidget {
  const ProjectTile(this.project, {super.key, required this.width});

  final ProjectEntity project;
  final double width;

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  bool hasHover = false;
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (hover) {
        setState(() => hasHover = hover);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConstraints.medium),
        constraints: BoxConstraints(
          maxWidth: max(widget.width, 250),
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: hasHover
                  ? context.colors.primary
                  : context.theme.disabledColor,
              width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(1).copyWith(bottom: 0),
              child: AspectRatio(
                aspectRatio: 1.6,
                child: CachedNetworkImage(
                  imageUrl: widget.project.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => const Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
            TileDivider(
              color: hasHover ? context.colors.primary : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstraints.medium,
                vertical: AppConstraints.small,
              ),
              child: Text(
                listToString(widget.project.techStack),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
            ),
            TileDivider(
              color: hasHover ? context.colors.primary : null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstraints.medium,
                vertical: AppConstraints.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.project.name,
                      style: context.textTheme.titleLarge),
                  const Gap(AppConstraints.small),
                  Text(
                    widget.project.shortDescription,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.theme.disabledColor,
                    ),
                  ),
                  if (widget.project.isPublished) ...[
                    const Gap(AppConstraints.medium),
                    OutlinedButton(
                      onPressed: () => showProjectLinksDialogBox(
                        context,
                        appName: widget.project.name,
                        appStoreLink: widget.project.appStoreLink,
                        playStoreLink: widget.project.playStoreLink,
                      ),
                      child: const Text("Live <~>"),
                    ),
                  ] else
                    const Gap(AppConstraints.small),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
