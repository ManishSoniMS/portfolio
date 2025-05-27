import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constraints.dart';
import '../constants/colors.dart';

class DefaultTheme {
  DefaultTheme._() {
    final textTheme = TextTheme(
      headlineLarge: GoogleFonts.firaCode(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: GoogleFonts.firaCode(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: GoogleFonts.firaCode(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.firaCode(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.firaCode(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.firaCode(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );

    FlexSchemeData flexScheme = FlexSchemeData(
      name: 'Midnight blue',
      description: 'Midnight blue theme, custom definition of all colors',
      light: FlexSchemeColor(
        primary: PortfolioColors.dark.primary,
        primaryContainer: Color(0xFF00325B),
        primaryLightRef: Color(0xFF545A92),
        secondary: Color(0xFFFFB59D),
        secondaryContainer: Color(0xFF872100),
        secondaryLightRef: Color(0xFFAC3306),
        tertiary: Color(0xFF86D2E1),
        tertiaryContainer: Color(0xFF004E59),
        tertiaryLightRef: Color(0xFF006875),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
      ),
      dark: FlexSchemeColor(
        primary: PortfolioColors.dark.primary,
        primaryContainer: Color(0xFF00325B),
        primaryLightRef: Color(0xFF545A92),
        secondary: Color(0xFFFFB59D),
        secondaryContainer: Color(0xFF872100),
        secondaryLightRef: Color(0xFFAC3306),
        tertiary: Color(0xFF86D2E1),
        tertiaryContainer: Color(0xFF004E59),
        tertiaryLightRef: Color(0xFF006875),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
      ),
    );

    const subTheme = FlexSubThemesData(
      textButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      inputDecoratorRadius: 10.0,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
    );

    ThemeData dark = FlexThemeData.dark(
      textTheme: textTheme.apply(
        bodyColor: PortfolioColors.dark.white,
        decorationColor: PortfolioColors.dark.white,
        displayColor: PortfolioColors.dark.white,
      ),
      appBarBackground: PortfolioColors.dark.scaffoldBackgroundColor,
      colors: flexScheme.dark,
      appBarElevation: 0,
      visualDensity: VisualDensity.standard,
      subThemesData: subTheme,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );

    _darkTheme = dark.copyWith(
      scaffoldBackgroundColor: PortfolioColors.dark.scaffoldBackgroundColor,
      disabledColor: PortfolioColors.dark.grey,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstraints.medium,
            vertical: AppConstraints.small,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          side: BorderSide(width: 1, color: PortfolioColors.dark.primary),
          foregroundColor: PortfolioColors.dark.white,
          textStyle: GoogleFonts.firaCode(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: PortfolioColors.dark.white,
          overlayColor: PortfolioColors.dark.scaffoldBackgroundColor,
          textStyle: GoogleFonts.firaCode(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static DefaultTheme get instance => DefaultTheme._();

  ThemeData get darkTheme => _darkTheme!;

  ThemeData? _darkTheme;
}
