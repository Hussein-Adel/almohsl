import 'dart:io';

import 'package:almohsl/utils/util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  Rx<File>? file;
  RxString fileName = ''.obs;

  RxList<TextEditingController> textFieldList = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ].obs;

  clearCar() {
    textFieldList
      ..clear()
      ..addAll([
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ]);
  }

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file?.value = File(result.files.single.path!);
      fileName.value = result.names.single!;
      print(fileName.value);
    } else {
      Util.kToastNOFilePicked();
      // User canceled the picker
    }
  }

  deleteFile() {
    file = null;
    fileName.value = '';
  }
}
