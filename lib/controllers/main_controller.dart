import 'dart:io';

import 'package:almohsl/data/models/request/car_request.dart';
import 'package:almohsl/data/repository/car_repo.dart';
import 'package:almohsl/ui/screens/cars_screen.dart';
import 'package:almohsl/utils/util.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../constants/constants.dart';
import '../data/di/locator.dart';
import '../data/models/response/response.dart';
import '../data/networks/network_constant.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  PagingController<int, CarDataResponse>? pagingCarController;
  Rx<BottomType> bottomType = BottomType.matchData.obs;
  RxList<CarDataResponse> cars = <CarDataResponse>[].obs;
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
    TextEditingController(),
  ].obs;
  Position? currentPosition;

  clearCar() {
    bottomType.value = BottomType.matchData;
    textFieldList
      ..clear()
      ..addAll([
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ]);
  }

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!).obs;
      fileName.value = result.names.single!;
      bottomType.value = BottomType.updateData;
    } else {
      Util.kToastNOFilePicked();
      // User canceled the picker
    }
  }

  deleteFile() {
    bottomType.value = BottomType.matchData;
    file = null;
    fileName.value = '';
  }

  startFile1DataPagingControllerListener() {
    pagingCarController =
        PagingController<int, CarDataResponse>(firstPageKey: 1);
    pagingCarController?.addPageRequestListener((pageKey) {
      getFile1Data(pageKey: pageKey);
    });
    isLoading.value = true;
  }

  startMatchedDataPagingControllerListener() {
    pagingCarController =
        PagingController<int, CarDataResponse>(firstPageKey: 1);
    pagingCarController?.addPageRequestListener((pageKey) {
      matchedData(pageKey: pageKey);
    });
    isLoading.value = true;
  }

  Future<void> choseFileAndUpload(context) async {
    Util.choseFileDialog(context,
        confirmTab: uploadFile1, cancelTab: uploadFile2);
  }

  onChange(String value) {
    bool allEmpty = true;
    textFieldList.forEach((element) {
      if (element.text.isNotEmpty) {
        allEmpty = false;
      }
    });
    if (allEmpty) {
      bottomType.value = BottomType.matchData;
    } else {
      bottomType.value = BottomType.updateData;
    }
  }

  Future<bool> uploadFile1Data() async {
    if (carKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    try {
      var data = CarRequest(
          carNumber: textFieldList[0].text,
          type: textFieldList[1].text,
          location: textFieldList[2].text,
          district: textFieldList[3].text,
          url: textFieldList[3].text,
          lng: '${currentPosition?.longitude}',
          lat: '${currentPosition?.latitude}');
      final result = await _carRepository.uploadFile1Data(data);
      if (result.data != null) {
        isLoading.value = false;
        startFile1DataPagingControllerListener();
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

  Future<void> confirmDeletionRecord(context, int index) async {
    Util.confirmDeletionDialog(context,
        confirmTab: () => deleteFile1Record(index),
        cancelTab: () => Get.back());
  }

  Future<bool> deleteFile1Record(int index) async {
    isLoading.value = true;
    try {
      final result = await _carRepository.deleteFile1Record(cars[index].id!);
      if (result.data != null) {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          title: 'تم حذف الملف',
          message: '${result.error?.message}',
        ));
        cars.removeAt(index);
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

  Future<bool> uploadFile1() async {
    Get.back();
    if (file?.value == null) return false;
    isLoading.value = true;
    try {
      var data = dio.FormData.fromMap(
          {"file": await dio.MultipartFile.fromFile(file!.value.path)});
      final result = await _carRepository.uploadFile1(data);
      if (result.data != null) {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          title: 'تم رفع الملف بنجاح',
          message: fileName.value,
        ));
        cars.value = result.data!;
        deleteFile();
        Get.to(CarsScreen());
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

  Future<bool> uploadFile2() async {
    Get.back();
    if (file?.value == null) return false;
    isLoading.value = true;
    try {
      var data = dio.FormData.fromMap(
          {"file": await dio.MultipartFile.fromFile(file!.value.path)});
      final result = await _carRepository.uploadFile2(data);
      if (result.data != null) {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          title: 'تم رفع الملف بنجاح',
          message: fileName.value,
        ));
        deleteFile();
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

  getLocation() async {
    currentPosition = await _determinePosition();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  ///
  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Fluttertoast.showToast(
          msg: "ميزة الموقع غير مفعلة",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.gray,
          textColor: AppColors.white,
          fontSize: AppFontSizes.kS5);
      // return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Fluttertoast.showToast(
            msg: "تم رفض تفعيل ميزة الموقع",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.gray,
            textColor: AppColors.white,
            fontSize: AppFontSizes.kS5);
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> matchedData({required int pageKey}) async {
    isLoading.value = true;
    try {
      final result = await _carRepository.matchedData(pageKey: pageKey);
      if (result.data != null) {
        isLoading.value = false;
        final isLastPage = result.data!.length < NetworkConstant.kPageSize;
        if (isLastPage) {
          pagingCarController?.appendLastPage(result.data!);
        } else {
          final nextPageKey = pageKey + 1;
          pagingCarController?.appendPage(result.data!, nextPageKey);
        }
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

  Future<bool> getFile1Data({required int pageKey}) async {
    try {
      final result = await _carRepository.getFile1Data(pageKey: pageKey);
      if (result.data != null) {
        isLoading.value = false;
        final isLastPage = result.data!.length < NetworkConstant.kPageSize;
        if (isLastPage) {
          pagingCarController?.appendLastPage(result.data!);
        } else {
          final nextPageKey = pageKey + 1;
          pagingCarController?.appendPage(result.data!, nextPageKey);
        }
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
