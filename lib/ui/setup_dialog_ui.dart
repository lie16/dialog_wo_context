import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/enums/dialog_type.dart';
import 'package:dialog_wo_context/ui/smart_widgets/dialog/basic_custom_dialog.dart';
import 'package:dialog_wo_context/ui/smart_widgets/dialog/form_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();
  dialogService.registerCustomDialogBuilder(
    variant: DialogType.Form,
    builder: (BuildContext context, DialogRequest dialogRequest) => Dialog(
      backgroundColor: Colors.transparent,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: customDialogUi(
            dialogRequest,
            (dialogRespone) => dialogService.completeDialog(dialogRespone),
          )),
      // child: _FormCustomDialog(
      //   dialogRequest: dialogRequest,
      //   onDialogTap: (dialogRespone) =>
      //       dialogService.completeDialog(dialogRespone),
      // )),
    ),
  );
}

Widget customDialogUi(
  DialogRequest dialogRequest,
  Function(DialogResponse) onDialogTap,
) {
  var dialogType = dialogRequest.variant as DialogType;
  print('DialogREq Variant: ${dialogRequest.variant}');
  print('DialogType = $dialogType');
  switch (dialogType) {
    case DialogType.Form:
      return FormCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: onDialogTap,
      );
    case DialogType.Basic:
    default:
      return BasicCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: onDialogTap,
      );
  }
}
