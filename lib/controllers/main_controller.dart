import 'dart:io';

import 'package:almohsl/data/models/request/car_request.dart';
import 'package:almohsl/data/repository/car_repo.dart';
import 'package:almohsl/utils/util.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/di/locator.dart';

class MainController extends GetxController {
  Rx<File>? file;
  RxString fileName = ''.obs;
  final GlobalKey<FormState> carKey = GlobalKey<FormState>();
  final _carRepository = locator<CarRepository>();
  RxBool isLoading = false.obs;
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

  Future<bool> uploadFile1Data(BuildContext context) async {
    if (carKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    try {
      var data = CarRequest(
          carNumber: textFieldList[0].text,
          type: textFieldList[1].text,
          location: textFieldList[2].text,
          district: textFieldList[3].text);
      final result = await _carRepository.uploadFile1Data(data);
      if (result.data != null) {
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          title: 'error',
          message: '${result.error?.message}',
        ));
        return false;
      }
    } on DioException catch (e) {
      isLoading.value = false;
      Get.showSnackbar(
        GetSnackBar(
          title: 'DioException error',
          message: '${e.message}',
        ),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
