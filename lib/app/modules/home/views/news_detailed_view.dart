import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/app/data/news_model.dart';
import 'package:news_app/app/functions/timestamp_convertion.dart';
import 'package:news_app/app/modules/home/controllers/news_controller.dart';

class NewsDetailedView extends StatelessWidget {
  const NewsDetailedView({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.arrow_back_ios_new), Text("Back")],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: news.urlToImage,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      news.title,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      ],
                    ),
                    const SizedBox(height: 12),

                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              maxLines: 1,
                              timeAgo(news.publishedAt.toString()),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          SizedBox(width: 60,),

                          CircleAvatar(
                            backgroundColor:
                            Theme.of(context).colorScheme.primary,
                            radius: 12,
                            child: Text(
                              news.author[0],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13,color: Colors.white,),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              news.author,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  fontSize: 16,),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    //TTS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hear the news",style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            fontSize: 16),),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.grey, width: 0.4)),
                              child: Obx(() {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    newsController.isSpeaking.value
                                        ? IconButton(
                                            onPressed: () async {
                                              await newsController.stopSpeaking();
                                            },
                                            icon: Icon(
                                              Icons.pause,
                                              size: 30,
                                            ))
                                        : IconButton(
                                            onPressed: () async {
                                              await newsController
                                                  .speak(news.description);
                                            },
                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              size: 30,
                                            )),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        child: Lottie.asset(
                                          "assets/lottie/audio_animation.json",
                                          height: 70,
                                          width: 250,
                                          animate: newsController.isSpeaking.value,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ))
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        news.description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
