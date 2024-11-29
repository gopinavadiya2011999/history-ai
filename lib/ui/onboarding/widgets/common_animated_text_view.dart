import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';

class CommonAnimatedTextView extends StatelessWidget {
  const CommonAnimatedTextView({super.key, required this.title, required this.desc});

  final String title;
  final String desc;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(
              title,
              speed: const Duration(milliseconds: 100),
              textStyle: GoogleFonts.inter(fontSize: 35, fontWeight: FontWeight.w500, color: ColorConstants.black11),
            ),
          ],
        ),
        const SizedBox(height: 15),
        FutureBuilder(
          future: Future.delayed(const Duration(seconds: 4)), // Delay of 100ms
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.only(top: 3), child: SvgPicture.asset(ImageConstant.arrowLong, width: 26)),
                  const SizedBox(width: 16),
                  Flexible(
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(desc,
                            speed: const Duration(milliseconds: 50),
                            textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: ColorConstants.gray92)),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}
