import 'package:flutter/material.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/chat/common_dropdown.dart';
DropdownStyle dropDownStyle() {
  return DropdownStyle(
      selectedItemColor: Colors.grey.withOpacity(.2),
      borderRadius: BorderRadius.circular(2),
      elevation: 1,
      padding: const EdgeInsets.all(14),
      trailingIcon: Icons.done_rounded);
}

DropdownButtonStyle dropDownButtonStyle({double? borderRadius}) {
  return DropdownButtonStyle(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    width: double.maxFinite,
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 1, color: ColorConstants.green6BB),
      borderRadius: BorderRadius.circular(borderRadius ?? 100),
    ),
    elevation: 0,
    backgroundColor: ColorConstants.green6BB,
    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 24),
    primaryColor: Colors.transparent,
    bgColor: Colors.transparent,
  );
}
