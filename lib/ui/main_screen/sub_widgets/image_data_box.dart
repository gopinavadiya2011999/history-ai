import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

import '../../../infrastructure/constant/color_constant.dart';

class ImageDataBox extends StatelessWidget {
  const ImageDataBox({super.key, required this.bgImage, required this.icon, required this.titleText, required this.desc, this.onTap});

  final String bgImage;
  final String icon;
  final String titleText;
  final String desc;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap ?? () {},
      child: Container(
        height: 175,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorConstants.black11)),
                  child: SvgPicture.asset(icon, height: 24, width: 24),
                ),
                const SizedBox(width: 8),
                HeadlineBodyOneBaseWidget(title: titleText, titleColor: ColorConstants.gray92, fontSize: 14, fontWeight: FontWeight.w500),
              ],
            ),
            // const SizedBox(height: 54),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: HeadlineBodyOneBaseWidget(title: desc, titleColor: ColorConstants.black11, fontSize: 17, fontWeight: FontWeight.w500)),
                const SizedBox(width: 4),
                SvgPicture.asset(ImageConstant.forwardArrow)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
