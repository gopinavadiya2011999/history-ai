import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class CommonBtnContainer extends StatelessWidget {
  const CommonBtnContainer({super.key, required this.isSelected, required this.title, required this.onTap});


  final bool isSelected;
  final String title;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  CommonInkwell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: isSelected?ColorConstants.green6BB:Colors.transparent,
            borderRadius: BorderRadius.circular(50)

        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: HeadlineBodyOneBaseWidget(
          title: title,
          titleTextAlign: TextAlign.center,
          style: GoogleFonts.archivo(
              color: isSelected?ColorConstants.black11:ColorConstants.white,
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
