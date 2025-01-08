import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        bool? isLogin = pref.getBool('isLogin');
        if (isLogin == true) {
          Get.toNamed(RouteConstants.mainScreen);
        } else {

          Get.toNamed(RouteConstants.intro);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(ImageConstant.splashBg))),
      child: Center(
        child: Lottie.asset(ImageConstant.humanDependsRobot),
      ),
    );
  }
}
