import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
        this.textCapitalization,
      this.maxLines,
      this.prefixIcon,
      this.hintText,
      this.onTap,
      this.controller,
      this.labelText,
      this.suffixIcon,
      this.obscureText,
      this.validator, this.radius, this.minLines});
  final int? maxLines;
  final int? minLines;
  final double? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final GestureTapCallback? onTap;
  final TextCapitalization ?textCapitalization;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (labelText != null)
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: HeadlineBodyOneBaseWidget(
              title: labelText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              titleColor: ColorConstants.black10,
            ),
          ),
        if (labelText != null) const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText ?? false,
          onTap: onTap,
          textCapitalization:textCapitalization??  TextCapitalization.none,
          validator: validator,
          keyboardType: TextInputType.multiline,
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLines ?? 1,
          minLines: minLines??1,
          controller: controller,
          cursorColor: ColorConstants.black11,
          style: GoogleFonts.inter(
            color: ColorConstants.black11,
            fontSize: 16,
          ),
          decoration: InputDecoration(

            suffixIcon: suffixIcon ?? const SizedBox(),
            prefixIcon: prefixIcon ?? const SizedBox(width: 10),
            border: commonBorder(context,radius:radius),
            prefixIconConstraints: BoxConstraints(maxHeight: prefixIcon != null ? 24 : 0, maxWidth: prefixIcon != null ? 42 : 10),
            suffixIconConstraints: BoxConstraints(maxHeight: suffixIcon != null ? 24 : 0, maxWidth: suffixIcon != null ? 42 : 0),
            focusedBorder: commonBorder(context,radius:radius),
            enabledBorder: commonBorder(context,radius:radius),
            disabledBorder: commonBorder(context,radius:radius),
            //contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            hintStyle: GoogleFonts.inter(
              color: ColorConstants.black87,
              fontSize: 16,
            ),
            hintText: hintText ?? "",
          ),
        ),
      ],
    );
  }
}

commonBorder(BuildContext context,{double ?radius}) {
  return OutlineInputBorder(borderRadius: BorderRadius.circular(radius??100),
      borderSide: const BorderSide(color: ColorConstants.grayD6));
}
