import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogExampleViewModel extends BaseViewModel {
  bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  //This Part got one problem
  DialogResponse _dialogResponse;
  DialogResponse get customDialogResult => _dialogResponse;

  String _dialogResponseString;
  String get dialogResponseString => _dialogResponseString;

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

  Future showCustomBasicDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.Basic,
      title: 'My custom basic dialog',
      description: 'This is my dialog description',
      mainButtonTitle: 'Confirm',
    );
    //Form for custom Basic use _confirmationResult
    _dialogResponse = response;
    print('DialogResponse: ${response?.responseData}');
    notifyListeners();
  }

  Future showCustomFormDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.Form,
      title: 'My custom dialog',
      description: 'This is my dialog description',
      mainButtonTitle: 'Confirm',
    );
    _dialogResponseString = response?.responseData[0];
    print('_dRepsonse: ' + _dialogResponseString);
    notifyListeners();
  }
}
