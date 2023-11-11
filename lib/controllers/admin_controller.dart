import 'package:almohsl/constants/constants.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  Rx<AdminSwitch> adminSwitch = AdminSwitch.addUser.obs;
  changeAdminSwitch(AdminSwitch value) {
    adminSwitch.value = value;
  }
}
