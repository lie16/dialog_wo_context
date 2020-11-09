import 'package:injectable/injectable.dart';
import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/datamodels/post.dart';
import 'package:dialog_wo_context/services/posts_service.dart';
import 'package:stacked/stacked.dart';

@singleton
class PostsViewModel extends FutureViewModel<List<Post>> {
  final _postsService = locator<PostsService>();

  @override
  Future<List<Post>> futureToRun() {
    print('Fetch posts');
    return _postsService.getPostsForUser(3);
  }
}
