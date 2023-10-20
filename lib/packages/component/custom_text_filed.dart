import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Color color;
  final double widthButton;
  final bool isPassword;
  final Widget? imageIcon;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final IconButton? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.color = Colors.white,
    this.widthButton = 30,
    this.isPassword = false,
    this.validator,
    this.onSaved,
    this.imageIcon,
    this.onSubmitted,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.widthButton.w),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        textCapitalization: TextCapitalization.none,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          hintText: widget.label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color: AppColors.fontcolorGray,
            fontSize: 14.sp,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w400,
            height: 5.h,
          ),
          filled: true,
          fillColor: widget.color,
          prefixIcon: widget.imageIcon,
          contentPadding:
              EdgeInsets.only(left: 17.0.w, top: 17.0.h, bottom: 17.h),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0.r),
            borderSide: const BorderSide(
              color: AppColors.kPrimaryLight,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0.r),
            borderSide: const BorderSide(
              color: AppColors.kPrimaryLight,
            ),
          ),
        ),
      ),
    );
  }
}
