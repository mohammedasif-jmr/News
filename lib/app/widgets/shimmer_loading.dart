import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//Common shimmer container widget
class LoadingContainer extends StatelessWidget {
  const LoadingContainer(
      {super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.surface,
        highlightColor: Theme.of(context).colorScheme.primaryContainer,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10)),
        ));
  }
}


//Shimmer loading effect for trending cards
class TrendingLoadingCard extends StatelessWidget {
  const TrendingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      width: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingContainer(
              width: MediaQuery.of(context).size.width, height: 200),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoadingContainer(
                    width: MediaQuery.of(context).size.width / 3, height: 10),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width / 5, height: 10),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: LoadingContainer(
                        width: MediaQuery.of(context).size.width, height: 15)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: LoadingContainer(
                width: MediaQuery.of(context).size.width / 2, height: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const LoadingContainer(width: 25, height: 25),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: LoadingContainer(
                      width: MediaQuery.of(context).size.width / 3, height: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


//shimmer loading news tile
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
