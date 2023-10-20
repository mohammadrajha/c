class Dimen {
  static double base = 2; // 2.0

  static double xs = base; // 2.0

  static double sm = base * xs; // 4.0

  static double md = sm * base; // 8.0

  static double large = md * base; // 16.0

  static double xLarge = large * base; // 32.0

  static double xxLarge = xLarge * base; // 64.0

  static double xxxLarge = xxLarge * base; // 128.0

  static double half = 0.5; // half of the screen

  static double quarter = 0.25; // quarter of the screen

  static double fullScreen = 1; // full screen
}
