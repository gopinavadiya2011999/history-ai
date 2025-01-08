import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'shimmer_package.dart';

class CommonProfileView extends StatelessWidget {
  const CommonProfileView({super.key, this.imageUrl, this.height, this.width});
  final String? imageUrl;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 80,
        width: width ?? 80,
        child: imageUrl == null && imageUrl!.isEmpty
            ? Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorConstants.grey8B)),
                child: const Icon(Icons.person, size: 40),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: imageUrl!.contains('http')
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.grey.withOpacity(0.2),
                            child: Container(
                              height: height ?? 80,
                              width: width ?? 80,
                              decoration: const BoxDecoration(color: ColorConstants.black11),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Container(
                            height: height ?? 80,
                            width: width ?? 80,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.5)),
                            child: const Icon(Icons.person, size: 50),
                          );
                        },
                      )
                    : Image.file(File(imageUrl!))));
  }
}
