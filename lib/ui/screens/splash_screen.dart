import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import 'screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    initData();
  }

  // late AuthController authController;

  void initData() async {
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    startAnimation();
    await authController.checkUserLoggedIn().then((value) => startAnimation());
  }

  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Center(
            child: Image.asset(
              AppAssets.kLogo,
              scale: 1,
            ),
          ),
        ));
  }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  startAnimation() async {
    animationController.forward();
    animationController.addListener(() {});
    animationController.addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          if (authController.isLoggedIn) {
            Get.off(MainScreen());
          } else {
            Get.off(LoginScreen());
          }
        }
      },
    );
  }
}
