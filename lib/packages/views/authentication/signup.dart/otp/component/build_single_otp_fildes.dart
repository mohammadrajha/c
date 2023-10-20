import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class BuildSingleOTPField extends StatefulWidget {
  final int index;
  final List<FocusNode> focusNodes;
  final List<TextEditingController> controllers;

  const BuildSingleOTPField(
      {super.key,
      required this.index,
      required this.focusNodes,
      required this.controllers});

  @override
  State<BuildSingleOTPField> createState() => _BuildSingleOTPFieldState();
}

class _BuildSingleOTPFieldState extends State<BuildSingleOTPField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 75.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: TextField(
          onChanged: (value) {
            if (value.length == 1 &&
                widget.index < widget.focusNodes.length - 1) {
              FocusScope.of(context)
                  .requestFocus(widget.focusNodes[widget.index + 1]);
            }
            if (value.isEmpty && widget.index > 0) {
              FocusScope.of(context)
                  .requestFocus(widget.focusNodes[widget.index - 1]);
            }
          },
          focusNode: widget.focusNodes[widget.index],
          controller: widget.controllers[widget.index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: TextStyle(fontSize: 22.sp),
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: AppColors.kPrimaryLight,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF3F9FF)),
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kPrimaryColor),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }
}
