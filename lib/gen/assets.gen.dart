/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/FiraCode-Bold.ttf
  String get firaCodeBold => 'assets/fonts/FiraCode-Bold.ttf';

  /// File path: assets/fonts/FiraCode-Light.ttf
  String get firaCodeLight => 'assets/fonts/FiraCode-Light.ttf';

  /// File path: assets/fonts/FiraCode-Medium.ttf
  String get firaCodeMedium => 'assets/fonts/FiraCode-Medium.ttf';

  /// File path: assets/fonts/FiraCode-Regular.ttf
  String get firaCodeRegular => 'assets/fonts/FiraCode-Regular.ttf';

  /// File path: assets/fonts/FiraCode-SemiBold.ttf
  String get firaCodeSemiBold => 'assets/fonts/FiraCode-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    firaCodeBold,
    firaCodeLight,
    firaCodeMedium,
    firaCodeRegular,
    firaCodeSemiBold,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/dots.svg
  String get dots => 'assets/icons/dots.svg';

  /// File path: assets/icons/double_quote.svg
  String get doubleQuote => 'assets/icons/double_quote.svg';

  /// File path: assets/icons/drawer.svg
  String get drawer => 'assets/icons/drawer.svg';

  /// File path: assets/icons/github.svg
  String get github => 'assets/icons/github.svg';

  /// File path: assets/icons/instagram.svg
  String get instagram => 'assets/icons/instagram.svg';

  /// File path: assets/icons/linkedin.svg
  String get linkedin => 'assets/icons/linkedin.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/logo_outline.svg
  String get logoOutline => 'assets/icons/logo_outline.svg';

  /// File path: assets/icons/mail.svg
  String get mail => 'assets/icons/mail.svg';

  /// List of all assets
  List<String> get values => [
    dots,
    doubleQuote,
    drawer,
    github,
    instagram,
    linkedin,
    logo,
    logoOutline,
    mail,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/about_me.png
  AssetGenImage get aboutMe =>
      const AssetGenImage('assets/images/about_me.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [aboutMe, user];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
