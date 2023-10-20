import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/provider/authprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../services/theme/app_colors.dart';
import '../../../../component/custom_appbar.dart';
import '../../../../component/custom_text_filed.dart';
import '../../../../component/text.dart';
import '../../../../component/title.dart';
import '../../../welcome_page/component/custom_build_button.dart';
import '../curent_location/curent_location.dart';

class FullName extends StatefulWidget {
  static const String routename = 'FullName';
  const FullName({super.key});

  @override
  State<FullName> createState() => _FullNameState();
}

class _FullNameState extends State<FullName> {
  final _firstnameController = TextEditingController();
  final _lastameController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  var _firstName = '';
  var _lastName = '';

  void _submit() async {
    final isValid = _fromKey.currentState!.validate();
    if (isValid) {
      _fromKey.currentState!.save();

      // جلب phone_number، password و u_id من SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? phoneNumber = prefs.getString('phoneNumber');
      String? password = prefs.getString('password');
      String? u_id = prefs.getString('u_id');

      // الآن، قم بإرسال البيانات إلى API
      try {
        await Provider.of<AuthProvider>(context, listen: false).sendUserData(
          u_id: u_id ?? '',
          phone_number: phoneNumber ?? '',
          password: password ?? '',
          first_name: _firstName,
          last_name: _lastName,
        );

        Navigator.of(context).pushNamed(CurentLocation.routename);
      } catch (error) {
        // يمكنك التعامل مع الأخطاء هنا
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send data: $error')),
        );
      }
    }
  }

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
              title: 'Let us know you',
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 32.h),
              child: buildTitle('Congratulations!'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: buildText('Please enter your first & last name', 14,
                  AppColors.fontcolor),
            ),
            SizedBox(
              height: 36.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: CustomTextField(
                      widthButton: 0.0,
                      controller: _firstnameController,
                      label: 'First Name',
                      isPassword: false,
                      color: AppColors.kPrimaryLight,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a valid phone number.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _firstName = value!;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: CustomTextField(
                      widthButton: 0.0,
                      controller: _lastameController,
                      label: 'Last Name',
                      isPassword: false,
                      color: AppColors.kPrimaryLight,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a valid phone number.';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _lastName = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter, // لوضع الزر في الأسفل
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 32.h), // هنا نوضح الهامش من الأسفل
                  child: CustomBuildButton(
                    onPressed: () {
                      _submit();
                    },
                    text: 'Let’s Go',
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
