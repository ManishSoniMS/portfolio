import 'dart:ui';

class PortfolioColors {
  PortfolioColors._dark() {
    scaffoldBackgroundColor = Color(0xFF282C33);
    primary = Color(0xFFC778DD);
    white = Color(0xFFFFFFFF);
    grey = Color(0xFFABB2BF);
  }

  static PortfolioColors get dark => PortfolioColors._dark();

  late Color scaffoldBackgroundColor;
  late Color primary;
  late Color white;
  late Color grey;
}
