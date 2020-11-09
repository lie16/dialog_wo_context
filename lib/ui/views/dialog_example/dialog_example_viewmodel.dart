import 'package:dialog_wo_context/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogExampleViewModel extends BaseViewModel {
  bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  DialogResponse _dialogResponse;
  DialogResponse get customDialogResult => _dialogResponse;
  final _dialogService = locator<DialogService>();

  Future showBasicDialog() async {
    DialogResponse response = await _dialogService.showDialog(
      title: 'The Basic Dialog',
      description:
          'This is the description for the dialog that shows up under the title',
      buttonTitle: 'This is the main button title',
      dialogPlatform: DialogPlatform.Cupertino, // DialogPlatform.Material
      cancelTitle: 'Cancel',
    );

    print('DialogResponse: ${response?.confirmed}');
  }

  Future showConfirmationDialog() async {
    var response = await _dialogService.showConfirmationDialog(
      title: 'The Confirmation Dialog',
      description: 'Do you want to update Confirmation state in the UI?',
      confirmationTitle: 'Yes',
      dialogPlatform: DialogPlatform.Material,
      cancelTitle: 'No',
    );

    _confirmationResult = response?.confirmed;

    print('DialogResponse: ${response?.confirmed}');
    notifyListeners();
  }

  Future showCustomDialog() async {}
}
