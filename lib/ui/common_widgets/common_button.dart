import 'package:character_ai/inftrastructure/constant/color_constant.dart';
import 'package:character_ai/ui/common_widgets/common_inkwell.dart';
import 'package:character_ai/ui/common_widgets/headline_body_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.buttonText, required this.onTap, this.fillColor, this.textColor});
final String buttonText;
final Color ?fillColor;
final Color ?textColor;
final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap:onTap,
      child: Container(

        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: fillColor??ColorConstants.purpleCd,
        ),
        child: HeadlineBodyOneBaseWidget(
         title:  buttonText,
          titleTextAlign: TextAlign.center,

          style: GoogleFonts.inter(fontWeight: FontWeight.w600,

              fontSize: 16, color: textColor??ThemeColors.primary(context)),
        ),
      ),
    );
  }
}
