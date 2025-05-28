import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../core/utils/extensions/on_build_context.dart';

class AboutMeImage extends StatelessWidget {
  const AboutMeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.images.aboutMe.path, // height: 507,
          width: 339,
        ),
        Positioned(
          top: 30,
          left: 0,
          child: SvgPicture.asset(Assets.icons.dots, height: 84, width: 84),
        ),
        Positioned(
          top: 100,
          bottom: 50,
          right: 0,
          child: SvgPicture.asset(Assets.icons.dots, height: 56, width: 104),
        ),
        Positioned(
          bottom: -1,
          left: 0,
          right: 0,
          child: Container(
            width: 339,
            height: 2,
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }
}
