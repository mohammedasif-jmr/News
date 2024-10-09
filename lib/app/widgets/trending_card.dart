import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/data/news_model.dart';
import 'package:news_app/app/functions/timestamp_convertion.dart';
import 'package:news_app/app/widgets/shimmer_loading.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, required this.onTap, required this.news});

  final NewsModel news;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            width: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.surface),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: news.urlToImage,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: LoadingContainer(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300)),
                        errorWidget: (context, url, error) => const Center(
                          child: const Icon(Icons.error),
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        timeAgo(news.publishedAt.toString()),
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        news.title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 12,
                        child: Text(
                          news.author[0],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          child: Text(
                        news.author,maxLines: 1,
                        style: Theme.of(context).textTheme.labelSmall,
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

