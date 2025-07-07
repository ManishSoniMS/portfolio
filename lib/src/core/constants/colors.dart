import 'dart:ui';

class PortfolioColors {
  PortfolioColors._dark() {
    scaffoldBackgroundColor = const Color(0xFF282C33);
    primary = const Color(0xFFC778DD);
    white = const Color(0xFFFFFFFF);
    grey = const Color(0xFFABB2BF);
  }

  static PortfolioColors get dark => PortfolioColors._dark();

  late Color scaffoldBackgroundColor;
  late Color primary;
  late Color white;
  late Color grey;
}
