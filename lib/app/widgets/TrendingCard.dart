import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
   TrendingCard({super.key, required this.imgUrl, required this.tag, required this.time, required this.title, required this.author});

  final String imgUrl;
  final String tag;
  final String time;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          width: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer
          ),
          child: Column(
            children: [
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.surface
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(fit: BoxFit.cover,imgUrl),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tag,style:Theme.of(context).textTheme.labelSmall,),
                    Text(time,style:Theme.of(context).textTheme.labelSmall,)
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(title,maxLines:2,style:Theme.of(context).textTheme.bodyLarge,)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(children: [

                  CircleAvatar(

                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 12,
                  ),
                  SizedBox(width: 10,),
                  Text(author)
                ],),
              )

            ],
          ),
        )
      ],
    );
  }
}
