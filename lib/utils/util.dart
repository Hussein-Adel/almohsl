import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';
import '../ui/components/components.dart';

class Util {
  static showSnackBar(BuildContext context, {required String? message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message ?? "")));
  }

  static void openMap({required String uri}) async {
    Uri url = Uri.parse(uri);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'whatsapp no installed';
    }
  }

  static void choseFileDialog(BuildContext context,
      {required VoidCallback confirmTab, required VoidCallback cancelTab}) {
    showDialog(
      context: context,
      builder: (context) {
        return ChoseUploadedFile(
          confirmTab: confirmTab,
          cancelTab: cancelTab,
        );
      },
    );
  }

  static void confirmDeletionDialog(BuildContext context,
      {required VoidCallback confirmTab, required VoidCallback cancelTab}) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDeletion(
          confirmTab: confirmTab,
          cancelTab: cancelTab,
        );
      },
    );
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
