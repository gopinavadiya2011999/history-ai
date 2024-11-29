import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

showTopToast({required String msg,required BuildContext context}){
  Fluttertoast.showToast(
    msg:msg,
    fontSize: 16,
    backgroundColor: ColorConstants.black11,
    textColor: ColorConstants.white,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
  );
}