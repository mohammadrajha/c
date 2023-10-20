import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/usermodel.dart';
import 'package:mai_jo/provider/authprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../services/theme/app_colors.dart';
import '../../../../component/custom_appbar.dart';
import '../../../../component/custom_text_filed.dart';
import '../../../../component/text.dart';
import '../../../../component/title.dart';
import '../../../welcome_page/component/custom_build_button.dart';
import '../full_name/full_name.dart';

class InputPassword extends StatefulWidget {
  static const String routename = 'InputPassword';
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  var _enteredPassword = '';

  void _submit() async {
    final isValid = _fromKey.currentState!.validate();
    if (isValid) {
      _fromKey.currentState!.save();

      // جلب phone_number و u_id من SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('password', _passwordController.text);
      String? phoneNumber = prefs.getString('phoneNumber');
      String? u_id = prefs.getString('u_id');

      // الآن، قم بإرسال البيانات إلى API
      try {
        await Provider.of<AuthProvider>(context, listen: false)
            .sendPasswordData(
          u_id: u_id ?? '',
          phone_number: phoneNumber ?? '',
          password: _enteredPassword,
          confirm_password: _confirmPasswordController.text,
        );

        Navigator.of(context).pushNamed(FullName.routename);
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
              title: 'Enter Password',
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 32.h),
              child: buildTitle('Password'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: buildText(
                  'Please enter your password ', 14, AppColors.fontcolor),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
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
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomTextField(
                widthButton: 0.0,
                controller: _confirmPasswordController,
                label: 'confirm Password',
                isPassword: true,
                color: AppColors.kPrimaryLight,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match!';
                  }
                  return null;
                },
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
                      _submit();
                    },
                    text: 'NEXT',
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
