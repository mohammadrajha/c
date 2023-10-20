import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLanguage {
  static String currentLanguage(BuildContext context) {
    return EasyLocalization.of(context)?.currentLocale?.languageCode ?? 'en';
  }
}
