import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DosingSchedulesController extends GetxController {
  TextEditingController timeController = TextEditingController(text: '12:00');
  final GlobalKey<FormState> formDoseKey = GlobalKey<FormState>();
  TextEditingController treatmentNameController = TextEditingController();
  RxBool generalStatus = false.obs;
  RxBool newDoseStatus = false.obs;
  RxList<DoseModel> dosesList = <DoseModel>[
    DoseModel(
        treatmentName: 'دورزولامول',
        doseTime: '12:00 Am',
        doseStatus: false.obs),
    DoseModel(
        treatmentName: 'دورزولامول',
        doseTime: '12:00 Am',
        doseStatus: true.obs),
    DoseModel(
        treatmentName: 'فارماتيرز', doseTime: '12:00 Am', doseStatus: true.obs),
    DoseModel(
        treatmentName: 'فارماتيرز',
        doseTime: '12:00 Am',
        doseStatus: false.obs),
  ].obs;
  changeStatus(int index, bool status) {
    dosesList[index].doseStatus?.value = status;
    update();
  }

  void changeGeneralStatus(bool status) {
    generalStatus.value = status;
  }

  changeNewDoseStatus(bool? status) {
    newDoseStatus.value = status ?? false;
  }

  addDose() {
    if (formDoseKey.currentState?.validate() != true) return false;
    dosesList.add(DoseModel(
        treatmentName: treatmentNameController.text,
        doseTime: '${timeController.text} Am',
        doseStatus: newDoseStatus));
    update();
    Get.back();
  }
}

class DoseModel {
  String? treatmentName;
  String? doseTime;
  RxBool? doseStatus;
  DoseModel({
    this.treatmentName,
    this.doseTime,
    this.doseStatus,
  });
}
