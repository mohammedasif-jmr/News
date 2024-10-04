import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:news_app/app/widgets/TrendingCard.dart';
import 'package:news_app/app/widgets/news_tile.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hot news",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    TrendingCard(
                        imgUrl:
                            "https://img.freepik.com/premium-photo/newspaper-template-daily-newspaper-with-text-picture-placeholder_1028938-6951.jpg",
                        tag: "News No.1",
                        time: "2 days ago",
                        title:
                            "This is the title hadfiab iashfou oasuhfoua oauhsf igfafiai",
                        author: "Author name"),
                    TrendingCard(
                        imgUrl:
                            "https://img.freepik.com/premium-photo/newspaper-template-daily-newspaper-with-text-picture-placeholder_1028938-6951.jpg",
                        tag: "News No.1",
                        time: "2 days ago",
                        title:
                            "This is the title hadfiab iashfou oasuhfoua oauhsf igfafiai",
                        author: "Author name"),
                    TrendingCard(
                        imgUrl:
                            "https://img.freepik.com/premium-photo/newspaper-template-daily-newspaper-with-text-picture-placeholder_1028938-6951.jpg",
                        tag: "News No.1",
                        time: "2 days ago",
                        title:
                            "This is the title hadfiab iashfou oasuhfoua oauhsf igfafiai",
                        author: "Author name"),
                  ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "News for you",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    NewsTile(
                        imgUrl:
                            "https://img.freepik.com/premium-photo/newspaper-template-daily-newspaper-with-text-picture-placeholder_1028938-6951.jpg",
                        author: "Asif",
                        title: "ajfoshdg[ouhaso sdhf osdo u ih ihd fosjb fs ojn sojb",
                        time: "1 day ago"),NewsTile(
                        imgUrl:
                            "https://img.freepik.com/premium-photo/newspaper-template-daily-newspaper-with-text-picture-placeholder_1028938-6951.jpg",
                        author: "Asif",
                        title: "ajfoshdg[ouhaso sdhf osdo u ih ihd fosjb fs ojn sojb",
                        time: "1 day ago"),NewsTile(
                        imgUrl:
                            "https://img.freepik.com/premium-photo/newspaper-template-daily-newspaper-with-text-picture-placeholder_1028938-6951.jpg",
                        author: "Asif",
                        title: "ajfoshdg[ouhaso sdhf osdo u ih ihd fosjb fs ojn sojb",
                        time: "1 day ago"),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
