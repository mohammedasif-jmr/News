import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/theme_controller.dart';
import 'package:news_app/app/widgets/bottom_nav_bar.dart';
import 'package:news_app/config/theme.dart';

import 'app/modules/home/controllers/bottom_nav_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Get.put(ThemeController()).isDarkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,

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
