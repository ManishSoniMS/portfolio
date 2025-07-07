import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../core/utils/extensions/on_build_context.dart';
import '../../core/utils/functions/open_link.dart';

enum AppLinkType { Android, iOS }

class AppLinkTile extends StatefulWidget {
  const AppLinkTile({super.key, required this.url, required this.type});

  final String url;
  final AppLinkType type;

  @override
  State<AppLinkTile> createState() => _AppLinkTileState();
}

class _AppLinkTileState extends State<AppLinkTile> {
  bool hasHover = false;
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (hover) {
        setState(() => hasHover = hover);
      },
      child: ListTile(
        onTap: () => openLink(widget.url),
        tileColor: context.colors.primary.withAlpha(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: context.colors.primary.withAlpha(60))),
        leading: SvgPicture.asset(
          widget.type == AppLinkType.Android
              ? Assets.icons.android
              : Assets.icons.apple,
          height: hasHover ? 44 : 40,
          width: hasHover ? 44 : 40,
        ),
        title: Text(
          widget.type.name,
          style: TextStyle(
            color: hasHover ? context.colors.primary : null,
          ),
        ),
        subtitle: Text(
          "Download from ${widget.type == AppLinkType.Android ? 'Play Store' : 'App Store'}",
          style: TextStyle(
            color: hasHover ? context.colors.primary : null,
          ),
        ),
      ),
    );
  }
}
