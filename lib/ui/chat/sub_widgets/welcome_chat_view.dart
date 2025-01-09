import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/model/character_model.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';

class WelcomeChatView extends StatelessWidget {
  const WelcomeChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 10),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(color: ColorConstants.black11, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorConstants.white)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(Get.put(MainController()).userModel != null
                    ? charData.where((element) => element.id == Get.put(MainController()).userModel?.profilePic).first.photo
                    : "assets/pngs/user_profile.png"),
              )),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadlineBodyOneBaseWidget(
                title: Get.put(MainController()).userModel != null
                    ? "${Get.put(MainController()).userModel?.firstName} ${Get.put(MainController()).userModel?.lastName}"
                    : "Titik Ceria",
                style: GoogleFonts.inter(color: ColorConstants.white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              HeadlineBodyOneBaseWidget(
                title: "Welcome",
                style: GoogleFonts.inter(color: ColorConstants.white, fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(border: Border.all(color: ColorConstants.green6BB), borderRadius: BorderRadius.circular(50)),
            child: const HeadlineBodyOneBaseWidget(
              titleColor: ColorConstants.green6BB,
              title: "Chat AI",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
