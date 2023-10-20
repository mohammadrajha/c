import 'package:flutter/material.dart';
import 'build_single_otp_fildes.dart';

class BuildOTPFields extends StatelessWidget {
  final List<FocusNode> focusNodes;
  final List<TextEditingController> controllers;

  const BuildOTPFields(
      {super.key, required this.focusNodes, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        4,
        (int index) => BuildSingleOTPField(
            index: index, focusNodes: focusNodes, controllers: controllers),
      ),
    );
  }
}
