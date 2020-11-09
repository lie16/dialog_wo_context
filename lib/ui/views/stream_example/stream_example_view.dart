import 'package:flutter/material.dart';

import 'package:dialog_wo_context/ui/views/stream_example/stream_example_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StreamExampleView extends StatelessWidget {
  const StreamExampleView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamExampleViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(child: Text(model.title)),
              floatingActionButton: FloatingActionButton(
                onPressed: model.swapSources,
              ),
            ),
        viewModelBuilder: () => StreamExampleViewModel());
  }
}
