import 'package:character_ai/inftrastructure/constant/color_constant.dart';
import 'package:character_ai/ui/common_widgets/common_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({super.key, this.maxLines, this.prefixIcon, this.hintText, this.onTap, this.controller, this.onSendTap});

  final int? maxLines;
  final IconData? prefixIcon;
  final String? hintText;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onSendTap;
  final TextEditingController? controller;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool send = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTap: widget.onTap,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.center,
            maxLines: widget.maxLines ?? 1,
            minLines: 1,
            controller: widget.controller,
            onChanged: (value) {
              if (value.trim().isNotEmpty) {
                send = true;
                setState(() {});
              } else {
                send = false;
                setState(() {});
              }
            },
            cursorColor: ThemeColors.primary(context),
            style: GoogleFonts.sahitya(
              color: ThemeColors.primary(context),
              fontSize: 16,
            ),
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      size: 24,
                      color: Colors.transparent,
                    )
                  : null,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 3), borderRadius: BorderRadius.all(Radius.circular(37))),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.transparent, width: 3)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.transparent, width: 3)),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.transparent, width: 3)),
              isDense: true,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              hintStyle: GoogleFonts.sahitya(
                color: ThemeColors.primary(context).withOpacity(0.5),
                fontSize: 16,
              ),
              hintText: widget.hintText ?? "",
              fillColor: ThemeColors.secondary(context).withOpacity(0.15),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CommonInkwell(
            onTap: widget.onSendTap ?? () {},
            child: Icon(Icons.send, color: send ? ThemeColors.primary(context) : ThemeColors.primary(context).withOpacity(0.5)))
      ],
    );
  }
}

commonBorder(BuildContext context) {
  return OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: ThemeColors.primary(context)));
}
