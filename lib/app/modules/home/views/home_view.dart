import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
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
                    color: Theme.of(context).colorScheme.primaryContainer,
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
                // CarouselSlider(
                //   items: [NewsLoadingTile(),NewsLoadingTile(),NewsLoadingTile(),],
                //   carouselController: buttonCarouselController,
                //   options: CarouselOptions(
                //     autoPlay: false,
                //     enlargeCenterPage: true,
                //     viewportFraction: 0.9,
                //     aspectRatio: 2.0,
                //     initialPage: 2,
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  height: 340,
                  child: CarouselSlider.builder(
                    itemCount: newsController.trendingNewsList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        TrendingCard(
                            news: newsController.trendingNewsList[itemIndex],
                            onTap: () {
                              Get.to(() => NewsDetailedView(
                                    news: newsController
                                        .trendingNewsList[itemIndex],
                                  ));
                            }),
                    options: CarouselOptions(
                      enlargeFactor: 0.1,
                      disableCenter: true,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      aspectRatio: 2,
                      initialPage: 2,

                      onPageChanged: (index, reason) {

                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  child: Text('→'),
                ),

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Obx(() {
                //     return newsController.isTrendingLoading.value
                //         ? buildCardLoading()
                //         : Row(
                //             children: newsController.trendingNewsList
                //                 .map((e) => TrendingCard(
                //                     news: e,
                //                     onTap: () {
                //                       Get.to(() => NewsDetailedView(
                //                             news: e,
                //                           ));
                //                     }),)
                //                 .toList());
                //   }),
                // ),
                buildSectionTitle(context: context, title: "News for you"),
                Obx(() {
                  return newsController.isNewsForULoading.value
                      ? buildNewsTileLoading()
                      : Column(
                          children: newsController.newsForYou5
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
                buildSectionTitle(context: context, title: "Business News"),
                Obx(() {
                  return newsController.isBusinessNewsLoading.value
                      ? buildNewsTileLoading()
                      : Column(
                          children: newsController.businessNews5
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
                buildSectionTitle(context: context, title: "Apple News"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() {
                    return newsController.isAppleNewsLoading.value
                        ? buildCardLoading()
                        : Row(
                            children: newsController.appleNews5
                                .map((e) => TrendingCard(
                                    news: e,
                                    onTap: () {
                                      Get.to(() => NewsDetailedView(
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
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "See All",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
