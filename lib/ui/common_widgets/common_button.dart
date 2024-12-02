import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.buttonText, required this.onTap, this.fillColor, this.textColor, this.isLoading = false});
  final String buttonText;
  final Color? fillColor;
  final Color? textColor;
  final bool isLoading;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: isLoading ? 9.5 : 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: fillColor ?? ColorConstants.black11,
        ),
        child: isLoading
            ? Center(
                child: Transform.scale(
                  scale: 0.8,
                  child: const CircularProgressIndicator(
                    color: ColorConstants.black11,
                  ),
                ),
              )
            : HeadlineBodyOneBaseWidget(
                title: buttonText,
                titleTextAlign: TextAlign.center,
                style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16, color: textColor ?? ColorConstants.white),
              ),
      ),
    );
  }
}
