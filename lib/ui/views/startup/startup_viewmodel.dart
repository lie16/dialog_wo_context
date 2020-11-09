import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/app/router.gr.dart';
import 'package:dialog_wo_context/services/shared_preferences_service.dart';
import 'package:dialog_wo_context/system/app_database.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _sharedPreferences = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();
  final _database = locator<AppDatabase>();

  Future initialise() async {
    var hasUser = _sharedPreferences.hasUser;
    if (hasUser) {
      var currentAddress = await _database.getCurrentAddress();
      if (currentAddress == null) {
        // has permissions
        // if they don't we request permissions before navigating
        await _navigationService.replaceWith(Routes.addressSelectionView);
      } else {
        await _navigationService.replaceWith(Routes.homeView);
      }
    }
  }
}
