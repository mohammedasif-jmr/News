import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/bottom_nav_controller.dart';

class CustBottomNavBAr extends StatelessWidget {
  const CustBottomNavBAr({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 200,
            height: 55,

            decoration: BoxDecoration(

                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.5),
                  blurRadius:0.5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.index.value = 0;
                  },
                  child: Obx(
                    () => buildNavIcon(
                        context: context,
                        controller: controller,
                        icon: Icons.home,
                        index: 0),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: Obx(
                    () => buildNavIcon(
                        context: context,
                        controller: controller,
                        icon: Icons.book,
                        index: 1),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.index.value = 2;
                  },
                  child: Obx(
                    () => buildNavIcon(
                        context: context,
                        controller: controller,
                        icon: Icons.settings,
                        index: 2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavIcon(
      {required BottomNavController controller,
      required BuildContext context,
      required int index,
      required icon}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
        width: 40,
        height: 40,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: controller.index.value == index
                ? Theme.of(context).colorScheme.primary
                : null,
            borderRadius: BorderRadius.circular(100)),
        child: Icon(icon,
            size: controller.index.value == index ? 26 : 23,
            color: controller.index.value == index
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.onSurface));
  }
}
