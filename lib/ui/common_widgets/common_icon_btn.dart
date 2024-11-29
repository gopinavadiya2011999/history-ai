import 'package:flutter/material.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';

class CommonIconBtn extends StatelessWidget {
  const CommonIconBtn({super.key, required this.iconData, this.onTap, this.color});
final IconData iconData;
final Color ?color;
final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap??()=>{},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color??ColorConstants.black11),
        ),
        child:  Icon(
          iconData,
          size: 18,
          color: color,
        ),
      ),
    );
  }
}
