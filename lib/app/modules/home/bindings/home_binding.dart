import 'package:get/get.dart';

import 'package:news_app/app/modules/home/controllers/bottom_nav_controller_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
