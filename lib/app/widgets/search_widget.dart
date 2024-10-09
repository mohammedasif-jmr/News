import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/modules/home/controllers/news_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme
                .of(context)
                .colorScheme
                .primaryContainer),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: "Search News..",
                      // prefixIcon: Icon(Icons.search),
                      fillColor: Theme
                          .of(context)
                          .colorScheme
                          .primaryContainer,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none)),
                )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Obx(() =>newsController.isNewsForULoading.value?
                 Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: const CircularProgressIndicator(

                        color: Colors.white),
                  ),
                ):InkWell(
                onTap: (){
                  newsController.searchNews(searchController.text);

                },
                  child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary),
                  child: const Icon(Icons.search),
                                ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
