import 'package:get/get.dart';
import 'package:news_app/app/modules/home/views/article_view.dart';
import 'package:news_app/app/modules/home/views/home_view.dart';
import 'package:news_app/app/modules/home/views/profile_view.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [ HomeView(), const ArticleView(), const ProfileView()];
}
