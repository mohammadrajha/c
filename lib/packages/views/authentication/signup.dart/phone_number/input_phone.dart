import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/usermodel.dart';
import 'package:mai_jo/packages/views/authentication/signup.dart/otp/otp.dart';
import 'package:mai_jo/provider/authprovider.dart';
import 'package:mai_jo/services/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../component/custom_appbar.dart';
import '../../../../component/custom_text_filed.dart';
import '../../../../component/text.dart';
import '../../../../component/title.dart';
import '../../../welcome_page/component/custom_build_button.dart';
import 'package:uuid/uuid.dart';

class InputPhone extends StatefulWidget {
  static const String routename = 'InputPhone';
  const InputPhone({super.key});

  @override
  State<InputPhone> createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  final _phoneNumberController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  var _enteredPhone = '';

  void handleRegistration(BuildContext context) async {
    if (_fromKey.currentState!.validate()) {
      try {
        print("Entered phone number is: ${_phoneNumberController.text}");

        var uuid = Uuid();
        String u_id = uuid.v4();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('phoneNumber', _phoneNumberController.text);
        await prefs.setString(
            'u_id', u_id); // هنا قمنا بحفظ u_id في SharedPreferences

        UserModel newUser = UserModel(
          phone_number: _phoneNumberController.text,
          u_id: u_id,
        );

        // استقبل الرد كمعجم
        Map<String, dynamic> response =
            await Provider.of<AuthProvider>(context, listen: false)
                .registerUser(newUser);

        // استخرج القيمة Verification_Code من المعجم
        String? verificationCode =
            (response['Verification_Code'] ?? '').toString();

        if (verificationCode != null) {
          // استخدم AuthProvider لحفظ Verification_Code
          Provider.of<AuthProvider>(context, listen: false)
              .saveVerificationCode(verificationCode);
        }
        print("Verification_Code: $verificationCode");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtpPage()),
        );
      } catch (error) {
        print("Error during registration: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register: $error')),
        );
      }
    }
  }

  // void handleRegistration(BuildContext context) async {
  //   if (_fromKey.currentState!.validate()) {
  //     try {
  //       print("Entered phone number is: ${_phoneNumberController.text}");

  //       var uuid = Uuid();
  //       String u_id = uuid.v4();

  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('phoneNumber', _phoneNumberController.text);

  //       UserModel newUser = UserModel(
  //         phone_number: _phoneNumberController.text,
  //         // ... other properties ...
  //         u_id: u_id,
  //       );

  //       await Provider.of<AuthProvider>(context, listen: false)
  //           .registerUser(newUser);

  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const OtpPage()),
  //       );
  //     } catch (error) {
  //       print("Error during registration: $error");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to register: $error')),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              backgroundColorIcon: AppColors.kPrimaryLight,
              iconColor: AppColors.kPrimaryColor,
              textColor: AppColors.fontcolor,
              onBackButtonPressed: () {},
              title: 'Phone number',
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 32.h),
              child: buildTitle('First!'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child:
                  buildText('Enter your phone number', 14, AppColors.fontcolor),
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          // يمكنك وضع الإجراء الذي تريده تنفيذه عند النقر على الكبسة هنا
                        },
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryLight, // لون الخلفية
                            borderRadius: BorderRadius.circular(
                                12.0.r), // تدوير الزوايا للكبسة
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '+962',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.fontcolorGray, // لون الخط
                                  fontFamily: 'poppins', // نوع الخط
                                ),
                              ),
                              // PathSvg.arrowDown,
                            ],
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: CustomTextField(
                      widthButton: 0.0,
                      controller: _phoneNumberController,
                      label: 'Your Phone Number',
                      isPassword: false,
                      color: AppColors.kPrimaryLight,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a valid phone number.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _enteredPhone = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 11.h, right: 5.w),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColors.fontcolorGray,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                        text:
                            'By continuing, I confirm I have read and agreed with the '),
                    TextSpan(
                      text: 'Privacy & Policy',
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigator.of(context).pushNamed(InputPhone.routename);
                        },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter, // لوضع الزر في الأسفل
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 32.h), // هنا نوضح الهامش من الأسفل
                  child: CustomBuildButton(
                    onPressed: () {
                      handleRegistration(context);
                    },
                    text: 'Verify',
                    fontColor: AppColors.bgWhite,
                    buttonColor: AppColors.kPrimaryColor,
                    borderColor: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
