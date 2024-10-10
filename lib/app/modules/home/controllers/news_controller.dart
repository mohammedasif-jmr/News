import 'dart:convert';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/app/data/news_model.dart';
import 'package:news_app/config/api.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> trendingNews5= <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews5 = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNews5 = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> businessNews5 = <NewsModel>[].obs;

  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForULoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isTeslaNewsLoading = false.obs;
  RxBool isBusinessNewsLoading = false.obs;
  RxBool isSpeaking = false.obs;

  FlutterTts flutterTts = FlutterTts();

  @override
  void onInit() async {
    super.onInit();
    getTrendingNews();
    getNewsForYou();
    getAppleNews();
    getBusinessNews();
    getTeslaNews();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$api";

    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        trendingNewsList.clear();

        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
        trendingNews5.value = trendingNewsList.sublist(0, 5).obs;

      } else {
        Get.snackbar(
          'Error',
          'Failed to load news: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.TOP,
      );
    }
    isTrendingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForULoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$api";

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        newsForYouList.clear();

        for (var news in articles) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYouList.sublist(0, 5).obs;
      } else {
        Get.snackbar(
          'Error',
          'Failed to load news: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.TOP,
      );
    }
    isNewsForULoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleNewsLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2024-10-06&sortBy=popularity&pageSize=30&apiKey=$api";

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        appleNewsList.clear();

        for (var news in articles) {
          appleNewsList.add(NewsModel.fromJson(news));
        }
        appleNews5.value = appleNewsList.sublist(0, 5);
      } else {
        Get.snackbar(
          'Error',
          'Failed to load news: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.TOP,
      );
    }
    isAppleNewsLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    isTeslaNewsLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-10-07&sortBy=popular&pageSize=20&apiKey=$api";

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        teslaNewsList.clear();

        for (var news in articles) {
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        teslaNews5.value = teslaNewsList.sublist(0, 5);
      } else {
        Get.snackbar(
          'Error',
          'Failed to load news: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.TOP,
      );
    }
    isTeslaNewsLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBusinessNewsLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$api";

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        businessNewsList.clear();

        for (var news in articles) {
          businessNewsList.add(NewsModel.fromJson(news));
        }
        businessNews5.value = businessNewsList.sublist(0, 5);
      } else {
        Get.snackbar(
          'Error',
          'Failed to load news: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.TOP,
      );
    }
    isBusinessNewsLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsForULoading.value = true;
    var baseUrl = "https://newsapi.org/v2/everything?q=$search&apiKey=$api";

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        newsForYouList.clear();
        int i = 0;
        for (var news in articles) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if (i >= 10) {
            break;
          }
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to load news: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.TOP,
      );
    }
    isNewsForULoading.value = false;
  }

  Future<void> speak(String text) async {
    if (text.isEmpty) return;

    isSpeaking.value = true;
    try {


      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setPitch(1.1);
      await flutterTts.speak(text);
      var res =await flutterTts.awaitSpeakCompletion(true);
      if(res==1){
        await stopSpeaking();
      }

      print(res.toString());
    } catch (e) {
      print("Error speaking: $e");
      isSpeaking.value = false;
    }
  }

  Future<void> stopSpeaking() async {
    try {
      await flutterTts.stop();
      isSpeaking.value = false;
    } catch (e) {
      print("Error stopping speech: $e");
    }
  }
}
