import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.imgUrl, required this.author, required this.title, required this.time});

  final String imgUrl;
  final String author;
  final String title;
  final String time;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(5) ,
      padding:EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),

      ),
      child:Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20)

            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imgUrl,fit: BoxFit.cover,),
            ),
          ),
          SizedBox(width: 10,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [

                  CircleAvatar(

                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 12,
                  ),
                  SizedBox(width: 10,),
                  Text(author)
                ],),
                SizedBox(height: 10,),
                Text(title,maxLines: 2,),
                SizedBox(height: 10,),
                Text(time,style: Theme.of(context).textTheme.labelSmall,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
