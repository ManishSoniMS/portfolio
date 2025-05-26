import 'package:flutter/material.dart';

import '../../core/utils/extensions/on_build_context.dart';

class TileDivider extends StatelessWidget {
  const TileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: context.theme.disabledColor);
  }
}
