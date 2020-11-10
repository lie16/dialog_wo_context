import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MediaService {
  Future<File> getImage({bool fromGallery}) async {
    // return ImagePicker.pickImage(
    final _pickedFile = await ImagePicker().getImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);
    return File(_pickedFile.path);
  }
}
