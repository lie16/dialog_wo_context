import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/datamodels/post.dart';
import 'package:dialog_wo_context/services/api.dart';
import 'package:stacked/stacked.dart';

class PostsViewModel extends FutureViewModel<List<Post>> {
  final int userId;
  PostsViewModel(this.userId);

  @override
  Future<List<Post>> futureToRun() => locator<Api>().getPostsForUser(userId);
}
