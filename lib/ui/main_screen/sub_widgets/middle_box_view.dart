import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/image_data_box.dart';
import 'package:history_ai/ui/person/search_by_person_controller.dart';

class MiddleBoxView extends StatelessWidget {
  const MiddleBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: ColorConstants.black11)),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset(ImageConstant.chatIcon),
                const SizedBox(width: 12),
                HeadlineBodyOneBaseWidget(
                  title: AppConstants.letsChat.tr,
                  style: GoogleFonts.archivo(color: ColorConstants.black, fontSize: 18, fontWeight: FontWeight.w500),
                ),

              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorConstants.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadlineBodyOneBaseWidget(
                      title: AppConstants.startNow.tr,
                      style: GoogleFonts.archivo(color: ColorConstants.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    HeadlineBodyOneBaseWidget(
                      title: AppConstants.seeAll.tr,
                      style: GoogleFonts.archivo(color: ColorConstants.white, fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child: ImageDataBox(
                          onTap: () {
                            Get.put(SearchByPersonController()).fetchPlaceDataFromFirestore();
                            Get.toNamed(RouteConstants.choosePlaceOptionView);
                            },
                      icon: ImageConstant.placeHistory,
                      desc: AppConstants.searchByPlace.tr,
                      bgImage: ImageConstant.placeBg,
                      titleText: AppConstants.place.tr,
                    )),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ImageDataBox(
                          onTap: () {
                            Get.put(SearchByPersonController()).fetchDataFromFirestore();
                            Get.toNamed(RouteConstants.choosePersonOptionScreen);
                          },
                      icon: ImageConstant.person,
                      desc: AppConstants.searchByPerson.tr,
                      bgImage: ImageConstant.placeBg,
                      titleText: AppConstants.person.tr,
                    )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
