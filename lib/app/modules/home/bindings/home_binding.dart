import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/bottom_nav_controller.dart';
import 'package:news_app/app/modules/home/controllers/news_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.lazyPut<BottomNavController>(
      () => BottomNavController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
