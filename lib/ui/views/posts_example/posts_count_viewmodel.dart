import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/services/posts_service.dart';
import 'package:stacked/stacked.dart';

class PostsCountViewModel extends BaseViewModel {
  int get postsCount => locator<PostsService>().posts.length;
}
