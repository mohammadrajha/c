import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../services/language/config/config_lang.dart';
import '../../../services/language/config/language_preferences.dart';
import '../../../services/language/generated/key_language.dart';
import '../../../services/restart/restart_app.dart';
import '../../../services/theme/app_colors.dart';
import '../../component/text.dart';
import '../../component/title.dart';
import '../authentication/login.dart/login.dart';
import '../authentication/signup.dart/phone_number/input_phone.dart';
import 'component/custom_build_button.dart';
import 'component/build_logo.dart';
import 'component/custom_button_language.dart';

class WelcomePage extends StatefulWidget {
  static const String routename = 'WelcomePage';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final ValueNotifier<String> selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = ValueNotifier<String>("");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSelectedLanguage();
    });
  }

  _loadSelectedLanguage() async {
    String deviceLanguage = Localizations.localeOf(context).languageCode;
    String savedLanguage = await LanguagePreferences.getSelectedLanguage();

    // استخدم اللغة المحفوظة إذا كانت موجودة، وإلا استخدم لغة الجهاز
    selectedLanguage.value =
        savedLanguage.isNotEmpty ? savedLanguage : deviceLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/LoginVector.svg',
            height: 350.h,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            children: [
              Column(
                children: [
                  buildLogo(),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 7.h, top: 71.h),
                      child: buildTitle(KeyLanguage.welcome),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: buildText(
                          KeyLanguage.textwelcome, 14, AppColors.fontcolor),
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  CustomBuildButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(InputPhone.routename);
                    },
                    text: KeyLanguage.signUp.tr(),
                    fontColor: AppColors.kPrimaryColor,
                    buttonColor: AppColors.kPrimaryLight,
                    borderColor: AppColors.kPrimaryColor,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomBuildButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginPage.routename);
                    },
                    text: KeyLanguage.login.tr(),
                    fontColor: AppColors.bgWhite,
                    buttonColor: AppColors.kPrimaryColor,
                    borderColor: AppColors.kPrimaryColor,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 31.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder<String>(
                  valueListenable: selectedLanguage,
                  builder: (context, value, child) {
                    return CustomButtonLanguage(
                      onPressed: () async {
                        selectedLanguage.value = 'English';
                        await LanguagePreferences.setSelectedLanguage(
                            selectedLanguage.value);
                        EasyLocalization.of(context)
                            ?.setLocale(ConfigLang.enLocale);
                        RestartApp.rebuild(context);
                      },
                      text: 'English',
                      selectedLanguage: selectedLanguage,
                      fontFamily: 'poppins',
                    );
                  },
                ),
                SizedBox(
                  width: 14.w,
                ),
                ValueListenableBuilder<String>(
                  valueListenable: selectedLanguage,
                  builder: (context, value, child) {
                    return CustomButtonLanguage(
                      onPressed: () async {
                        selectedLanguage.value = 'العربية';
                        await LanguagePreferences.setSelectedLanguage(
                            selectedLanguage.value);
                        EasyLocalization.of(context)
                            ?.setLocale(ConfigLang.arLocale);
                        RestartApp.rebuild(context);
                      },
                      text: 'العربية',
                      selectedLanguage: selectedLanguage,
                      fontFamily: 'tajawal',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
