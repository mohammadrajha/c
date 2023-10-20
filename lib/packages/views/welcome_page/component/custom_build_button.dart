// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomBuildButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final Color fontColor;
//   final Color borderColor;
//   final Color buttonColor;
//   const CustomBuildButton(
//       {super.key,
//       required this.text,
//       required this.onPressed,
//       required this.fontColor,
//       required this.buttonColor,
//       required this.borderColor});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 21.w),
//       child: SizedBox(
//         height: 52.h,
//         child: ElevatedButton(
//           onPressed: onPressed,
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(buttonColor),
//             shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.r),
//                 side: BorderSide(color: borderColor, width: 2.0.w),
//               ),
//             ),
//             elevation: MaterialStateProperty.all(0.0),
//           ),
//           child: Center(
//             child: Text(
//               text,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: fontColor,
//                 fontSize: 15.0.sp,
//                 fontFamily: 'poppins',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBuildButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color fontColor;
  final Color borderColor;
  final Color buttonColor;
  final String? svgIcon; // optional SVG icon

  const CustomBuildButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.fontColor,
    required this.buttonColor,
    required this.borderColor,
    this.svgIcon, // this makes it optional
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: SizedBox(
        height: 52.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(color: borderColor, width: 2.0.w),
              ),
            ),
            elevation: MaterialStateProperty.all(0.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgIcon != null)
                SvgPicture.asset(svgIcon!,
                    color: fontColor,
                    height: 20.h,
                    width: 20.w), // display SVG icon if it's provided
              if (svgIcon != null)
                SizedBox(width: 10.w), // space between icon and text
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 15.0.sp,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
