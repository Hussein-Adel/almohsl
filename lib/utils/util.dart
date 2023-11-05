import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constants.dart';

class Util {
  static showSnackBar(BuildContext context, {required String? message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message ?? "")));
  }

  static Future<bool?> kToastNOInternet() {
    return Fluttertoast.showToast(
        msg: "لا يوجد انترنت يرجى الأتصال بالأنترنت والمحاولة مرة أخرى",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.gray,
        textColor: AppColors.white,
        fontSize: AppFontSizes.kS5);
  }

  static Future<bool?> kToastNOFilePicked() {
    return Fluttertoast.showToast(
        msg: "لقد قمت بإلغاء أختيار الملف",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.gray,
        textColor: AppColors.white,
        fontSize: AppFontSizes.kS5);
  }
}
