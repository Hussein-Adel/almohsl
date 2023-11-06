import 'dart:io';

import 'package:almohsl/utils/util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  Rx<File>? file;
  RxString fileName = ''.obs;

  List<List<TextEditingController>> textFieldList = [];
  RxInt formCount = 0.obs;
  addCar() {
    formCount.value++;
    textFieldList.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]);
  }

  deleteCar(int index) {
    formCount.value--;
    textFieldList.removeAt(index);
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
