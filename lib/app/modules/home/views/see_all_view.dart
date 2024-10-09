import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/news_controller.dart';
import 'package:news_app/app/modules/home/views/news_detailed_view.dart';
import 'package:news_app/app/widgets/news_tile.dart';
import 'package:news_app/app/widgets/search_widget.dart';
import 'package:news_app/app/widgets/shimmer_loading.dart';

class ArticleView extends GetView {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SearchWidget(),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                return newsController.isNewsForULoading.value
                    ? Column(
                  children: List.generate(
                    10,
                        (index) =>const NewsLoadingTile(),
                  ),
                )
                    : Column(
                    children: newsController.newsForYouList
                        .map(
                          (e) => NewsTile(
                        news: e,
                        onTap: () {
                          Get.to(() => NewsDetailedView(news: e));
                        },
                      ),
                    )
                        .toList());
              }),
            ],
          ),
        ));
  }
}
