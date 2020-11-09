import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/datamodels/comment.dart';
import 'package:dialog_wo_context/services/api.dart';
import 'package:stacked/stacked.dart';

class CommentsViewModel extends FutureViewModel<List<Comment>> {
  final int postId;
  CommentsViewModel(this.postId);

  @override
  Future<List<Comment>> futureToRun() =>
      locator<Api>().getCommentsForPost(postId);
}
