import 'package:flutter/material.dart';

import '../../core/utils/extensions/on_build_context.dart';

enum DecorationRectangleShape { square, rectangle }

class DecorationRectangle extends StatelessWidget {
  const DecorationRectangle({
    super.key,
    required this.shape,
    this.dimension,
    this.height,
    this.width,
    this.onLeft = false,
    this.onRight = false,
  }) : assert(
         shape == DecorationRectangleShape.square
             ? dimension != null
             : height != null && width != null,
         'For square provide dimension; for rectangle provide height & width',
       );

  final DecorationRectangleShape shape;
  final double? dimension;
  final double? height;
  final double? width;
  final bool onLeft;
  final bool onRight;

  @override
  Widget build(BuildContext context) {
    final side = BorderSide(width: 1, color: context.theme.disabledColor);
    return Container(
      height: shape == DecorationRectangleShape.square ? dimension : height,
      width: shape == DecorationRectangleShape.square ? dimension : width,
      decoration: BoxDecoration(
        border: Border(
          top: side,
          bottom: side,
          left: onLeft ? BorderSide.none : side,
          right: onRight ? BorderSide.none : side,
        ),
      ),
    );
  }
}
