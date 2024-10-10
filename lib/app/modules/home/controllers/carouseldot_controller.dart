import 'package:get/get.dart';

class CarouselDotController extends GetxController {
  //TODO: Implement CarouseldotController

  final carouselDotIndex = 0.obs;
  void updatePage(int index) {
    carouselDotIndex.value = index;
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
