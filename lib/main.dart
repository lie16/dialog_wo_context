import 'package:flutter/material.dart';
import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/ui/views/dialog_example/dialog_example_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/router.gr.dart' as auto_router;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog no Context',
      home: DialogExampleView(),
      // initialRoute: Routes.startupViewRoute,
      onGenerateRoute: auto_router.Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
