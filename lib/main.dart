import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/widgets/bottom_nav_bar.dart';
import 'package:news_app/config/theme.dart';

import 'app/modules/home/controllers/bottom_nav_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: darkTheme,
      title: "Application",
      getPages: AppPages.routes,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CustBottomNavBAr(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
