import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mai_jo/packages/views/home_page/homepage.dart';
import 'package:mai_jo/provider/authprovider.dart';
import 'package:mai_jo/services/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../services/language/generated/key_language.dart';
import '../../../component/custom_link_text.dart';
import '../../../component/custom_text_filed.dart';
import '../../../component/text.dart';
import '../../../component/title.dart';
import '../../welcome_page/component/build_logo.dart';
import '../../welcome_page/component/custom_build_button.dart';
import '../signup.dart/phone_number/input_phone.dart';

class LoginPage extends StatefulWidget {
  static const String routename = 'LoginPage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  var _enteredPhone = '';
  var _enteredPassword = '';
  bool _isLoading = false;

  // void _login(BuildContext context) async {
  //   // إضافة التحقق من صحة النموذج
  //   if (!_fromKey.currentState!.validate()) {
  //     return;
  //   }

  //   setState(() {
  //     _isLoading = true; // بدء عملية التحميل
  //   });

  //   final phone_number = _phoneNumberController.text;
  //   final password = _passwordController.text;

  //   try {
  //     await Provider.of<AuthProvider>(context, listen: false).loginUser(
  //       phone_number,
  //       password,
  //     );
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => const HomePageScreen()),
  //         (Route<dynamic> route) => false);
  //   } catch (error) {
  //     showDialog(
  //       context: context,
  //       builder: (ctx) => AlertDialog(
  //         title: const Text('An error occurred'),
  //         content: Text(error.toString()),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(ctx).pop();
  //             },
  //             child: const Text('Okay'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  void _login(BuildContext context) async {
    // إضافة التحقق من صحة النموذج
    if (!_fromKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true; // بدء عملية التحميل
    });

    final phone_number = _phoneNumberController.text;
    final password = _passwordController.text;
    final u_uid = 'xr';

    try {
      await Provider.of<AuthProvider>(context, listen: false).loginUser(
        phone_number,
        password,
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePageScreen()),
          (Route<dynamic> route) => false);
    } catch (error) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An error occurred'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/icons/LoginVector.svg',
              height: 350.h,
              width: MediaQuery.of(context).size.width,
            ),
            Form(
              key: _fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLogo(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 140.w, right: 140.w, bottom: 7.h, top: 71.h),
                    child: buildTitle(KeyLanguage.titleLogin),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 70.w, right: 70.w, bottom: 7.h),
                      child: buildText(
                          KeyLanguage.textLogin, 14, AppColors.fontcolor),
                    ),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomTextField(
                      widthButton: 0.0,
                      controller: _phoneNumberController,
                      label: 'Phone Number',
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
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomTextField(
                      widthButton: 0.0,
                      controller: _passwordController,
                      label: 'Password',
                      isPassword: true,
                      color: AppColors.kPrimaryLight,
                      validator: (value) {
                        if (value == null || value.trim().length < 8) {
                          return 'Password must be at least  8 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredPassword = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  CustomBuildButton(
                    onPressed: () => _login(context),
                    text: KeyLanguage.login.tr(),
                    fontColor: AppColors.bgWhite,
                    buttonColor: AppColors.kPrimaryColor,
                    borderColor: AppColors.kPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 19.h),
                    child: buildText(
                        KeyLanguage.forgotPassword, 15, AppColors.fontcolor),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 32.h,
                      ), // هنا نوضح الهامش من الأسفل
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildText('Don\'t have an account?', 14,
                              AppColors.fontcolor),
                          customLinkText('Register', 14, () {
                            // هنا قم بتنفيذ الانتقال إلى الصفحة الأخرى
                            Navigator.of(context)
                                .pushNamed(InputPhone.routename);
                          })
                        ],
                      )),
                ],
              ),
            ),
            if (_isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5), // خلفية شبه شفافة
                  child: Center(
                    child: CircularProgressIndicator(), // مؤشر التحميل
                  ),
                ),
              ),
            // Align(
            //   alignment: Alignment.bottomCenter, // لوضع الزر في الأسفل
            //   child: Padding(
            //       padding: EdgeInsets.only(
            //         bottom: 32.h,
            //       ), // هنا نوضح الهامش من الأسفل
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           buildText('Don\'t have an account?', 14),
            //           customLinkText('Register', 14)
            //         ],
            //       )),
            // ),
          ],
        ),
      ),

      // floatingActionButton: Padding(
      //     padding: EdgeInsets.only(
      //       bottom: 32.h,
      //     ), // هنا نوضح الهامش من الأسفل
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         buildText('Don\'t have an account?', 14),
      //         customLinkText('Register', 14)
      //       ],
      //     )),
    );
  }
}
