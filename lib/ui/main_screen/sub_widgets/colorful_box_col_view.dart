import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class ColorfulBoxColView extends StatelessWidget {
  const ColorfulBoxColView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CommonIconTextView(
                bgColor: ColorConstants.greenEF,
                title: AppConstants.code.tr,
                desc: AppConstants.codeDesc.tr,
                icon: ImageConstant.code,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CommonIconTextView(
                bgColor: ColorConstants.pinkFd,
                title: AppConstants.summary.tr,
                desc: AppConstants.summaryDesc.tr,
                icon: ImageConstant.summary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CommonIconTextView(
                bgColor: ColorConstants.pinkFd,
                title: AppConstants.scan.tr,
                desc: AppConstants.scanDesc.tr,
                icon: ImageConstant.scan,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CommonIconTextView(
                bgColor: ColorConstants.greenEF,
                title: AppConstants.idea.tr,
                desc: AppConstants.ideaDesc.tr,
                icon: ImageConstant.idea,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CommonIconTextView extends StatelessWidget {
  const CommonIconTextView({super.key, required this.bgColor, required this.title, required this.desc, required this.icon, this.onTap});

  final Color bgColor;
  final String title;
  final String desc;
  final String icon;
  final GestureTapCallback ?onTap;

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap??()=>Get.toNamed(RouteConstants.chatScreen),
      child: Container(
        height: 166,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: ColorConstants.black11), color: bgColor),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon,width: 35),
                const SizedBox(width: 12),
                HeadlineBodyOneBaseWidget(
                  title: title,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  titleColor: ColorConstants.black11,
                ),
              ],
            ),
            HeadlineBodyOneBaseWidget(
              title: desc,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              titleColor: ColorConstants.black11,
            ),
          ],
        ),
      ),
    );
  }
}
