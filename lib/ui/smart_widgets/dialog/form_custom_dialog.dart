import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

class FormCustomDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const FormCustomDialog({
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
