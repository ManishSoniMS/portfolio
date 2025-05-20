import 'package:flutter/material.dart';

import '../../core/utils/extensions/on_build_context.dart';

class TileDivider extends StatelessWidget {
  const TileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: context.theme.disabledColor,
    );
  }
}
