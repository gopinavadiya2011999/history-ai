import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlineBodyOneBaseWidget extends StatelessWidget {
  const HeadlineBodyOneBaseWidget({
    super.key,
    this.title,
    this.titleColor,
    this.titleTextAlign = TextAlign.left,
    this.maxLine,
    this.fontWeight,
    this.textOverflow,
    this.fontSize,
    this.height,
    this.foreground,
    this.fontFamily,
    this.underline = false,
    this.letterSpacing,
    this.style,
  });

  final String? title;
  final Color? titleColor;
  final TextAlign? titleTextAlign;
  final int? maxLine;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final double? fontSize;
  final double? height;
  final Paint? foreground;
  final String? fontFamily;
  final bool underline;
  final double? letterSpacing;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: style ??
          GoogleFonts.inter(
            color: foreground == null ? titleColor : null,
            fontSize: fontSize,
            height: height,

            foreground: titleColor == null ? foreground : null,
            fontWeight: fontWeight ?? FontWeight.normal,
            decoration: underline ? TextDecoration.underline : null,
            letterSpacing: letterSpacing,
          ),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: true,
    );
  }
}
