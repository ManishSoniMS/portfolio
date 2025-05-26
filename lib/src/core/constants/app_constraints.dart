abstract class AppConstraints {
  AppConstraints._();

  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;

  static const double minMobileWidth = 325;
  static const double meanMobileWidth = 375;
  static const double maxMobileWidth = 425;

  static const double minDesktopWidth = 768;
  static const double meanDesktopWidth = 1024;
  static const double maxDesktopWidth = 1440;

  static double contentPadding(double size) {
    if (size >= maxDesktopWidth) {
      return 200;
    } else if (size <= meanDesktopWidth) {
      return extraLarge;
    } else if (size <= maxMobileWidth) {
      return medium;
    } else {
      return 171;
    }
  }
}
