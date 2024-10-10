import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/carouseldot_controller.dart';
import 'package:news_app/app/modules/home/controllers/news_controller.dart';
import 'package:news_app/app/modules/home/controllers/theme_controller.dart';
import 'package:news_app/app/modules/home/views/news_detailed_view.dart';
import 'package:news_app/app/widgets/news_tile.dart';
import 'package:news_app/app/widgets/trending_card.dart';

import '../../../widgets/shimmer_loading.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  CarouselSliderController buttonCarouselController =
  CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    ThemeController themeController = Get.put(ThemeController());
    CarouselDotController dotController = Get.put(CarouselDotController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge,
          ),
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.dashboard),
                padding: const EdgeInsets.all(5),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primaryContainer,
                    borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () {
                    themeController.toggleTheme();
                  },
                  icon: themeController.isDarkMode.value
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode),
                  padding: const EdgeInsets.all(5),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildSectionTitle(context: context, title: "Hot news"),
                Obx(() {
                  return SizedBox(
                    child: newsController.isTrendingLoading.value
                        ? CarouselSlider(items: List.generate(
                      5, (index) => TrendingLoadingCard(),),
                        options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              dotController.updatePage(index);
                            },
                            height: 340
                        ))
                        : CarouselSlider(items: newsController.trendingNews5
                        .map((e) =>
                        TrendingCard(
                            news: e,
                            onTap: () {
                              Get.to(() =>
                                  NewsDetailedView(
                                    news: e,
                                  ));
                            }),)
                        .toList(), options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          dotController.updatePage(index);
                        },
                        height: 340
                    )
                    ),
                  );
                }),
                SizedBox(height: 5,),

                Obx(() => buildDotIndicator(dotController, context)),
                buildSectionTitle(context: context, title: "News for you"),
                Obx(() {
                  return newsController.isNewsForULoading.value
                      ? buildNewsTileLoading()
                      : Column(
                      children: newsController.newsForYou5
                          .map(
                            (e) =>
                            NewsTile(
                              news: e,
                              onTap: () {
                                Get.to(() => NewsDetailedView(news: e));
                              },
                            ),
                      )
                          .toList());
                }),
                buildSectionTitle(context: context, title: "Business News"),
                Obx(() {
                  return newsController.isBusinessNewsLoading.value
                      ? buildNewsTileLoading()
                      : Column(
                      children: newsController.businessNews5
                          .map(
                            (e) =>
                            NewsTile(
                              news: e,
                              onTap: () {
                                Get.to(() => NewsDetailedView(news: e));
                              },
                            ),
                      )
                          .toList());
                }),
                buildSectionTitle(context: context, title: "Apple News"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() {
                    return newsController.isAppleNewsLoading.value
                        ? buildCardLoading()
                        : Row(
                        children: newsController.appleNews5
                            .map((e) =>
                            TrendingCard(
                                news: e,
                                onTap: () {
                                  Get.to(() =>
                                      NewsDetailedView(
                                        news: e,
                                      ));
                                }))
                            .toList());
                  }),
                ),
                buildSectionTitle(context: context, title: "Tesla News"),
                Obx(() {
                  return newsController.isTeslaNewsLoading.value
                      ? buildNewsTileLoading()
                      : Column(
                      children: newsController.teslaNews5
                          .map(
                            (e) =>
                            NewsTile(
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
          ),
        ));
  }

  Row buildCardLoading() {
    return const Row(
      children: [
        TrendingLoadingCard(),
        TrendingLoadingCard(),
      ],
    );
  }

  Column buildNewsTileLoading() {
    return const Column(
      children: [
        NewsLoadingTile(),
        NewsLoadingTile(),
        NewsLoadingTile(),
      ],
    );
  }

  Widget buildSectionTitle(
      {required BuildContext context, required String title}) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,
            ),
            TextButton(
              onPressed: () {  },
              child:Text("See All",)




            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget buildDotIndicator(CarouselDotController dotController, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: dotController.carouselDotIndex.value == index ? 12 : 8,
          height: dotController.carouselDotIndex.value == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotController.carouselDotIndex.value == index ? Theme
                .of(context)
                .colorScheme
                .primary : Colors.grey,
          ),
        );
      }),
    );
  }
}
