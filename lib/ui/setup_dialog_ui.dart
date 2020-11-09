import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/enums/dialog_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();
  dialogService.registerCustomDialogBuilder(
    variant: DialogType.Form,
    builder: (BuildContext context, DialogRequest dialogRequest) => Dialog(
      backgroundColor: Colors.transparent,
      child: Align(
          alignment: Alignment.bottomCenter,
          // child: customDialogUi(
          //   dialogRequest,
          //   (dialogRespone) => dialogService.completeDialog(dialogRespone),
          // ),
          child: _FormCustomDialog(
            dialogRequest: dialogRequest,
            onDialogTap: (dialogRespone) =>
                dialogService.completeDialog(dialogRespone),
          )),
    ),
  );
}

Widget customDialogUi(
  DialogRequest dialogRequest,
  Function(DialogResponse) onDialogTap,
) {
  var dialogType = dialogRequest.customData as DialogType;
  print('DialogType = $dialogType');
  switch (dialogType) {
    case DialogType.Form:
      return _FormCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: onDialogTap,
      );
    case DialogType.Basic:
    default:
      return _BasicCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: onDialogTap,
      );
  }
}

class _BasicCustomDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _BasicCustomDialog({
    Key key,
    this.dialogRequest,
    this.onDialogTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dialogRequest.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dialogRequest.description,
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            // Complete the dialog when you're done with it to return some data
            onTap: () => onDialogTap(DialogResponse(confirmed: true)),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FormCustomDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _FormCustomDialog({
    Key key,
    this.dialogRequest,
    this.onDialogTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController();
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              dialogRequest.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              // Complete the dialog when you're done with it to return some data
              onTap: () =>
                  onDialogTap(DialogResponse(responseData: [controller.text])),
              child: Container(
                child: dialogRequest.showIconInMainButton
                    ? Icon(Icons.check_circle)
                    : Text(dialogRequest.mainButtonTitle),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
