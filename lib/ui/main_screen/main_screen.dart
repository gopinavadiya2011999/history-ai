import 'package:flutter_svg/flutter_svg.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_controller.dart';
import 'sub_widgets/appbar_profile_row.dart';
import 'sub_widgets/middle_box_view.dart';
import 'sub_widgets/start_chat_button.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.homeBg), fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  if(controller.userModel!=null)
                  const AppbarProfileRow(),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 40),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: AppConstants.whatCanIDo.tr,
                              style: GoogleFonts.inter(color: ColorConstants.black11, fontSize: 40, fontWeight: FontWeight.w500),
                            ),
                            WidgetSpan(
                                child: Container(margin: const EdgeInsets.only(top: 0, left: 20), child: SvgPicture.asset(ImageConstant.appLogo)))
                          ])),
                        ),
                        const MiddleBoxView()
                      ],
                    ),
                  )),
                  const StartChatButton(),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
