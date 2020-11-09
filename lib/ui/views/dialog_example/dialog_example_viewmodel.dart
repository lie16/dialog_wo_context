import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogExampleViewModel extends BaseViewModel {
  bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  DialogResponse _dialogResponse;
  DialogResponse get customDialogResult => _dialogResponse;

  Future showBasicDialog() async {}

  Future showConfirmationDialog() async {}

  Future showCustomDialog() async {}
}
