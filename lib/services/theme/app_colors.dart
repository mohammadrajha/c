import 'package:flutter/material.dart';

class AppColors {
  static Color _colorFromHex(String hexColor, [String opacity = 'FF']) {
    /// hexColor => #FFFFFF
    final String color = hexColor.replaceAll('#', '');

    /// #FFFFFF => FFFFFF

    final lastColor =
        Color(int.parse(opacity + color, radix: 16)); //  FFFFFF => FFFFFFFF
    return lastColor;
    //  FFFFFF => 0xFFFFFFFF cause of redix 16 colors
  }

  static final Color kPrimaryColor = _colorFromHex('#0F89FF');
  static final Color kSecondaryColor = _colorFromHex('#0073E2');
  static final Color bgWhite = _colorFromHex('#FFFFFF');
  static final Color fontcolor = _colorFromHex('#535353');
  static const Color kPrimaryLight = Color(0x1A0F89FF);
  static final Color fontcolorGray = _colorFromHex('#777777');
  static final Color none = _colorFromHex('#');
  static final Color grayColorfont = _colorFromHex('#323232');

  static Color lightGray = _colorFromHex('#999999');
  static final Color redLight = Color.fromRGBO(255, 61, 0, 0.1);
  // static const Color grayLight = Color.fromARGB(67, 73, 97, 255);

  // //* all color App

  static final Color laghtColorGrayBackground =
      Color.fromRGBO(67, 73, 97, 0.04);
  static final Color fontLight = Color.fromRGBO(119, 119, 119, 1);
  static final Color yallowColor = Color.fromRGBO(255, 159, 36, 1);
  static final Color wightLight = Color.fromRGBO(255, 255, 255, 0.3);
  static final Color bluelight = Color.fromRGBO(15, 137, 255, 0.08);
  static final Color grayBackgroundLight = Color.fromRGBO(71, 71, 71, 0.08);
  // static final Color darkModeInstallBtn = _colorFromHex('#BB86FC');
  // static final Color lightModeUnInstallBtn = _colorFromHex('#e95f44');
  // static final Color darkModeUnInstallBtn = _colorFromHex('#FF0266');
  // static final Color lightModeToast = _colorFromHex('#90ee02');
  // static final Color darkModeToast = _colorFromHex('#BB86FC');
  // static final Color mb = _colorFromHex('#FF0266');

  // static final Color red = _colorFromHex('#B71c1c');
  // static final Color orange = _colorFromHex('#F57C00');
  // static final Color blackCardSocial = _colorFromHex('#000000', '54');

  // // * Loading
  // static final Color lightLoading = _colorFromHex('#46B5F6');
  // static final Color darkLoading = _colorFromHex('#BB86FC');
  // static final Color cardClick = _colorFromHex('#46B5F6');
  // static final Color cardClickDark = _colorFromHex('#BB86FC');

  // static final Color bgWhite = _colorFromHex('#FFFFFF');
  // static final Color bgBlack = _colorFromHex('#000000');
  // static final Color bgDark = _colorFromHex('#000000');
  // static final Color bgCursor = _colorFromHex('#3A3B3C');
  // static final Color bgGrey = _colorFromHex('#C8C8C8');
  // static final Color bgGreen = _colorFromHex('#A5D6A7');
  // static final Color bgGreenBold = _colorFromHex('#1B5E20');
  // static final Color bgBlue = _colorFromHex('#2196F3');
  // static final Color bgRed = _colorFromHex('#FD1D1D');

  // static const Color grey = Color(0xff8e8e8e);
  // static const Color black = Color(0xff000000);
  // // static const Color primaryColor = Color(0xff5DB1DF);
  // static const Color backgroundcolor = Color(0xffF8F9FD);
  // static const Color primaryColor = Color(0xffF2786D);
  // static Color blueLigh = _colorFromHex('#e6f2ff');
  // static Color iconColor = _colorFromHex('#5CAFFF');
  // static Color iconBackgrondColor = _colorFromHex('#E0EEFB');
  // static Color backgroundPagecard = _colorFromHex('#F9FBFC');
  // static Color fontColorTitle = _colorFromHex('#333333');
  // static Color fontColorblue = _colorFromHex('#0F89FF');
  // static Color fontColorGray = _colorFromHex('#DDDDDD');
  // static Color fontColorblack = _colorFromHex('#323232');
  // static Color backgroundColorBlue = _colorFromHex('#F3F9FF');
  // static Color fontColorButtonBlack = _colorFromHex('#535353');
  // static Color backgroundItemColor = _colorFromHex('#F0F6FD');
  // static Color backgroundPage = _colorFromHex('#F9FBFC');
  // static Color iconColorTitle = _colorFromHex('#858585');
  // static Color backgroundbuttoncolor = _colorFromHex('#F5F5F5');
  // static const Color kWhiteColor = Color(0xFFFFFFFF);
  // static const Color kPinkColor = Color(0xFFFE53BB);
  // static const Color kGreenColor = Color(0xFF09FBD3);
  // static const Color kBlackColor = Color(0xFF525252);

  // // Welcome Page
  // static const Color kPrimaryColor = Color(0xFF0F89FF);
  // static const Color kSecondaryColor = Color(0xFF0073E2);
  // // login Page
  // static const Color kAccentColor = Color(0xFF0F89FF);
  // static const Color kDefaultButtonColor = Color(0xFF0F89FF);
  // //otp Page
  // static const Color kResendCodeColor = Color(0xFFDDDDDD);

  // // font
  // static const String kFontFamily = 'Tajawal';
  // static const String kFontFamily2 = 'Poppins';
}
