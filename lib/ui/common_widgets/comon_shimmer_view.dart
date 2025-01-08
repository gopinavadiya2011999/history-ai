import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/shimmer_package.dart';
import 'package:flutter/material.dart';

class CommonShimmer{
  static customShimmerView({double ?height,double ?width,EdgeInsets ?margin,BorderRadiusGeometry? borderRadius}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),

      highlightColor: Colors.grey.withOpacity(0.2),
      child: Container(
        height: height ?? 24,
        margin: margin ?? EdgeInsets.zero,
        width: width ?? 130,
        decoration: BoxDecoration(color: ColorConstants.black11, borderRadius: borderRadius ?? BorderRadius.zero),
      ),
    );
  }}