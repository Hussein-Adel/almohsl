import 'dart:io';

import 'package:almohsl/utils/util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  File? file;
  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    } else {
      Util.kToastNOFilePicked();
      // User canceled the picker
    }
  }
}
