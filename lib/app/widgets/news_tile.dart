import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/data/news_model.dart';
import 'package:news_app/app/functions/timestamp_convertion.dart';
import 'package:news_app/app/widgets/shimmer_loading.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.onTap, required this.news});

  final NewsModel news;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: news.urlToImage,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(
                          child: LoadingContainer(width: 120, height: 120)),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        news.author,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelSmall,
                      ))
                    ],
                  ),
                  Text(
                    news.title,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    timeAgo(news.publishedAt.toString()),
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsLoadingTile extends StatelessWidget {
  const NewsLoadingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const LoadingContainer(width: 120, height: 120),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const LoadingContainer(width: 20, height: 20),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: LoadingContainer(
                          width: MediaQuery.of(context).size.width, height: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width, height: 15),
                const SizedBox(
                  height: 5,
                ),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width, height: 15),
                const SizedBox(
                  height: 10,
                ),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width / 4, height: 13),
              ],
            ),
          )
        ],
      ),
    );
  }
}
