// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dialog_wo_context/services/api.dart';
import 'package:dialog_wo_context/system/app_database.dart';
import 'package:dialog_wo_context/services/counter_service.dart';
import 'package:dialog_wo_context/services/third_party_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dialog_wo_context/services/media_service.dart';
import 'package:dialog_wo_context/services/permissions_service.dart';
import 'package:dialog_wo_context/services/posts_service.dart';
import 'package:dialog_wo_context/ui/views/posts_example/posts_viewmodel.dart';
import 'package:dialog_wo_context/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<Api>(() => Api());
  g.registerLazySingleton<AppDatabase>(() => AppDatabase());
  g.registerLazySingleton<CounterService>(() => CounterService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<MediaService>(() => MediaService());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<PermissionsService>(() => PermissionsService());
  g.registerLazySingleton<PostsService>(() => PostsService());
  g.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());

  //Eager singletons must be registered in the right order
  g.registerSingleton<PostsViewModel>(PostsViewModel());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
