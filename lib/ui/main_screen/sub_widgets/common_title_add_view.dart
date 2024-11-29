import 'package:flutter/material.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class CommonTitleAddView extends StatelessWidget {
  const CommonTitleAddView(
      {this.isDelete = true,
      super.key,
      required this.title,
      required this.isSelected,
      required this.onTap,
      this.onAddTap,
      this.onDeleteTap,
      this.bgColor});
  final Color? bgColor;
  final GestureTapCallback onTap;
  final GestureTapCallback? onAddTap;
  final GestureTapCallback? onDeleteTap;
  final String title;
  final bool isSelected;
  final bool isDelete;
  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: bgColor ?? ColorConstants.green6BB),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadlineBodyOneBaseWidget(
              title: title,
              fontSize: 16,
              titleColor: ColorConstants.black11,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: isSelected ? 0.5 : 0.0,
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 28,
              ),
            ),
            CommonInkwell(onTap: onAddTap ?? () => {}, child: const Icon(Icons.add)),
            if (isDelete) CommonInkwell(onTap: onDeleteTap ?? () => {}, child: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
