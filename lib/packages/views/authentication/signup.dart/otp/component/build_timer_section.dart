import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../services/theme/app_colors.dart';
import '../../../../../component/text.dart';
import '../../../../welcome_page/component/custom_build_button.dart';

class BuildTimerSection extends StatefulWidget {
  final VoidCallback onResendCode; // <-- وظيفة callback جديدة
  const BuildTimerSection({super.key, required this.onResendCode});

  @override
  _BuildTimerSectionState createState() => _BuildTimerSectionState();
}

class _BuildTimerSectionState extends State<BuildTimerSection> {
  Timer? timer;
  int totalTimeInSeconds = 60;
  String timeRemaining = '01:00';
  bool hasTimerStopped = false; // لتحقق متى يجب تغيير لون النص

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    hasTimerStopped = false;
    totalTimeInSeconds = 60;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (totalTimeInSeconds < 1) {
          setState(() {
            hasTimerStopped = true;
          });
          timer.cancel();
        } else {
          totalTimeInSeconds--;
          int minutes = (totalTimeInSeconds / 60).floor();
          int seconds = totalTimeInSeconds % 60;
          setState(() {
            if (seconds < 10) {
              timeRemaining = '0$minutes:0$seconds';
            } else {
              timeRemaining = '0$minutes:$seconds';
            }
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: buildText(timeRemaining, 14, AppColors.fontcolor),
        ),
        SizedBox(height: 21.h),
        CustomBuildButton(
          onPressed: () {
            if (hasTimerStopped) {
              setState(() {
                startTimer(); // إعادة بدء العد التنازلي
              });
              widget.onResendCode(); // استدعاء الوظيفة
            }
            // Navigator.of(context).pushNamed(LoginPage.routename);
          },
          text: 'Send another code',
          fontColor:
              hasTimerStopped ? AppColors.kPrimaryColor : AppColors.fontcolor,
          buttonColor: AppColors.kPrimaryLight,
          borderColor:
              hasTimerStopped ? AppColors.kPrimaryColor : AppColors.none,
        ),
        // GestureDetector(
        //   onTap: () {
        //     if (hasTimerStopped) {
        //       setState(() {
        //         startTimer(); // إعادة بدء العد التنازلي
        //       });
        //     }
        //   },
        //   child: Text(
        //     'Send another code',
        //     style: TextStyle(
        //       fontSize: 14.sp,
        //       color: hasTimerStopped
        //           ? Colors.black
        //           : const Color(
        //               0xFFDDDDDD), // تغيير اللون بناءً على حالة المتغير
        //       fontFamily: 'Poppins',
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
