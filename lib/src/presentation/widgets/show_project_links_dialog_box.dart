import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/constants/app_constraints.dart';
import '../../core/utils/extensions/on_build_context.dart';
import 'app_link_tile.dart';
import 'tile_divider.dart';

void showProjectLinksDialogBox(
  BuildContext context, {
  required String appName,
  String? playStoreLink,
  String? appStoreLink,
}) {
  showDialog(
    context: context,
    routeSettings: const RouteSettings(name: "show-project-links-dialog-box"),
    builder: (context) {
      return SimpleDialog(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        children: [
          ListTile(
            title: Text('Download $appName'),
            subtitle: (playStoreLink != null && appStoreLink != null)
                ? const Text("Choose your Platform")
                : null,
            trailing: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(AppConstraints.small * 0.5),
                decoration:
                    BoxDecoration(color: context.colors.primary.withAlpha(50)),
                child: const Icon(Icons.clear),
              ),
            ),
          ),
          const TileDivider(),
          Padding(
            padding: const EdgeInsets.all(AppConstraints.medium),
            child: Column(
              children: [
                if (playStoreLink != null) ...[
                  AppLinkTile(url: playStoreLink, type: AppLinkType.Android),
                  const Gap(AppConstraints.small)
                ],
                if (appStoreLink != null)
                  AppLinkTile(url: appStoreLink, type: AppLinkType.iOS),
              ],
            ),
          )
        ],
      );
    },
  );
}
