import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dialog_wo_context/app/locator.dart';
import 'package:dialog_wo_context/services/media_service.dart';
import 'package:stacked/stacked.dart';

class ImagePickerViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();
  File _selectedImage;

  bool get hasSelectedImage => _selectedImage != null;

  File get selectedIamge => _selectedImage;

  Future selectImage({@required bool fromGallery}) async {
    _selectedImage =
        await runBusyFuture(_mediaService.getImage(fromGallery: fromGallery));
  }
}
