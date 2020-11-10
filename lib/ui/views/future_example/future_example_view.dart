import 'package:flutter/material.dart';
import 'package:dialog_wo_context/ui/views/future_example/future_example_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FutureExampleView extends StatelessWidget {
  const FutureExampleView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureExampleViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                  child: model.isBusy
                      ? CircularProgressIndicator()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(model.data ?? 'NO_DATA'),
                          ],
                        )),
              floatingActionButton: FloatingActionButton(
                child: _ErrorMessage(),
                onPressed: () {},
              ),
            ),
        viewModelBuilder: () => FutureExampleViewModel());
  }
}

class _ErrorMessage extends ViewModelWidget<FutureExampleViewModel> {
  const _ErrorMessage({Key key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    FutureExampleViewModel model,
  ) {
    return model.hasError
        ? Text(
            model.modelError.message,
            style: TextStyle(color: Colors.red),
          )
        : Container();
  }
}
