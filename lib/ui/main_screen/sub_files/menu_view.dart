import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: ColorConstants.white,
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadlineBodyOneBaseWidget(
                          title: AppConstants.menu.tr,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          titleColor: ColorConstants.black11,
                        ),
                        CommonInkwell(onTap: () => Get.back(), child: SvgPicture.asset(ImageConstant.close))
                      ],
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                        child: Column(
                      children: [
                        commonRow(onTap: () {}, text: AppConstants.profile.tr, icon: ImageConstant.user),
                        commonRow(onTap: () {}, text: AppConstants.settings.tr, icon: ImageConstant.setting),
                        commonRow(onTap: () {}, text: AppConstants.helpCenter.tr, icon: ImageConstant.helpCenter),
                        commonRow(
                          onTap: () {
                            Get.toNamed(RouteConstants.addDataToFirestore);
                          },
                          text: "Add data to firestore",
                          icon: ImageConstant.helpCenter,
                          divider: false,
                        ),
                      ],
                    )),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(border: Border.all(color: ColorConstants.grayD8), borderRadius: BorderRadius.circular(50)),
                      child: HeadlineBodyOneBaseWidget(
                        title: AppConstants.logOut.tr,
                        titleTextAlign: TextAlign.center,
                        titleColor: ColorConstants.black11,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  commonRow({required String icon, required String text, bool divider = true, required GestureTapCallback onTap}) {
    return CommonInkwell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 8),
              HeadlineBodyOneBaseWidget(
                title: text,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                titleColor: ColorConstants.black11,
              ),
            ],
          ),
          if (divider)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              color: ColorConstants.gray92,
              height: 1,
              width: double.infinity,
            )
        ],
      ),
    );
  }
}
