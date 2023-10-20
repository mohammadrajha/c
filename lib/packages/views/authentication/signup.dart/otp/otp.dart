import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/usermodel.dart';
import 'package:mai_jo/provider/authprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../services/theme/app_colors.dart';
import '../../../../component/custom_appbar.dart';
import '../../../../component/custom_link_text.dart';
import '../../../../component/text.dart';
import '../../../../component/title.dart';
import '../../../welcome_page/component/custom_build_button.dart';
import '../password/input_password.dart';
import 'component/build_otp_fields.dart';
import 'component/build_timer_section.dart';

class OtpPage extends StatefulWidget {
  static const String routename = 'OtpPage';

  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String enteredOTP = ""; // إضافة متغير لحفظ الرمز المدخل

  final List<FocusNode> focusNodes =
      List<FocusNode>.generate(4, (_) => FocusNode());

  final List<TextEditingController> controllers =
      List<TextEditingController>.generate(4, (_) => TextEditingController());

  // Future<void> handleOTPSend(BuildContext context) async {
  //   // جمع القيم من حقول الإدخال
  //   enteredOTP = controllers.fold(
  //       "", (previousValue, element) => previousValue + element.text);

  //   // حفظ القيمة في نموذج المستخدم
  //   UserModel newUser = UserModel(
  //     // ... القيم الأخرى للنموذج ...
  //     otpCode: enteredOTP,
  //   );

  //   // حفظ القيمة في SharedPreferences
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('otpCode', enteredOTP);

  //   print('enter otp : ${enteredOTP}');

  //   try {
  //     await Provider.of<AuthProvider>(context, listen: false)
  //         .sendOTPToAPI(newUser);
  //     // بعد الإرسال بنجاح, قم بالانتقال إلى الصفحة التالية
  //     Navigator.of(context).pushNamed(InputPassword.routename);
  //   } catch (error) {
  //     print("Error sending OTP: $error");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to send OTP: $error')),
  //     );
  //   }
  // }
  void printValues(BuildContext context) async {
    final otp = controllers.map((controller) => controller.text).join('');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // طباعة القيمة المدخلة
    print("Entered OTP: $otp");

    // طباعة الـ Verification_Code من SharedPreferences
    String? verificationCode = prefs.getString('verificationCode');
    print("Verification_Code: $verificationCode");

    // طباعة phone_number و u_id من SharedPreferences
    String? phoneNumber = prefs.getString('phoneNumber');
    String? u_id = prefs.getString('u_id');
    print("Phone Number: $phoneNumber");
    print("U_ID: $u_id");

    // الآن، قم بإرسال البيانات إلى API
    await Provider.of<AuthProvider>(context, listen: false).sendDataToAPI(
      u_id: u_id ?? '',
      phone_number: phoneNumber ?? '',
      verificationCode: verificationCode ?? '',
      otpByUser: otp,
    );
    Navigator.of(context).pushNamed(InputPassword.routename);
  }

  Future<void> sendAnotherCode(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // طباعة phone_number و u_id من SharedPreferences
    String? phoneNumber = prefs.getString('phoneNumber');
    String? u_id = prefs.getString('u_id');

    // الآن، قم بإرسال البيانات إلى API
    // هنا يمكنك استدعاء وظيفة الإرسال إلى الواجهة البرمجية (API) مع القيم المطلوبة
    // مثلاً:
    await Provider.of<AuthProvider>(context, listen: false).sendAnotherCodeAPI(
      u_id: u_id ?? '',
      phone_number: phoneNumber ?? '',
    );

    // طباعة رسالة تأكيد أو إظهار رسالة للمستخدم بأن الكود تم إرساله مرة أخرى
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Code sent again!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            backgroundColorIcon: AppColors.kPrimaryLight,
            iconColor: AppColors.kPrimaryColor,
            textColor: AppColors.fontcolor,
            onBackButtonPressed: () {},
            title: 'Verification code',
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 32.h),
            child: buildTitle('OTP Verification!'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: buildText('A code has been sent to +962 799 999 999', 14,
                AppColors.fontcolor),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: customLinkText('Change the number?', 14, () {
              Navigator.pop(context);
            }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 19.w, top: 34.h),
            child: BuildOTPFields(
              controllers: controllers,
              focusNodes: focusNodes,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 15.h),
            child: buildText('You can request a new OTP verification code in',
                14, AppColors.fontcolor),
          ),
          BuildTimerSection(
            onResendCode: () {
              sendAnotherCode(context);
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter, // لوضع الزر في الأسفل
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 32.h), // هنا نوضح الهامش من الأسفل
                child: CustomBuildButton(
                  onPressed: () => printValues(context),
                  text: ' SUBMIT',
                  fontColor: AppColors.bgWhite,
                  buttonColor: AppColors.kPrimaryColor,
                  borderColor: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
