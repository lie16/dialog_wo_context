import 'package:injectable/injectable.dart';
import 'package:dialog_wo_context/datamodels/address.dart';

@lazySingleton
class AppDatabase {
  Future<Address> getCurrentAddress() {}
}
