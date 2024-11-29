import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.buttonText, required this.onTap, this.fillColor, this.textColor});
  final String buttonText;
  final Color? fillColor;
  final Color? textColor;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: fillColor ?? ColorConstants.black11,
        ),
        child: HeadlineBodyOneBaseWidget(
          title: buttonText,
          titleTextAlign: TextAlign.center,
          style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16, color: textColor ?? ColorConstants.white),
        ),
      ),
    );
  }
}
