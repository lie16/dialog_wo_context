import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/datamodels/user.dart';
import 'package:dialog_wo_context/services/api.dart';
import 'package:stacked/stacked.dart';

class UserViewModel extends FutureViewModel<User> {
  final int userId;
  UserViewModel(this.userId);

  @override
  Future<User> futureToRun() => locator<Api>().getUserProfile(userId);
}
