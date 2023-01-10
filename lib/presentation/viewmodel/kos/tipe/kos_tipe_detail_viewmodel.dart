import 'dart:io';

import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';

class KosTipeDetailViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  late KosTipeModel model;
  late KosModel kosModel;

  bool _isLoadingCTA = false;
  bool get isLoadingCTA => _isLoadingCTA;
  set isLoadingCTA(bool value) {
    _isLoadingCTA = value;
    notifyListeners();
  }

  void init({required int idKosTipe, required int idKos}) async {
    isLoading = true;
    await Future.wait([loadKos(idKos), loadTipe(idKosTipe)]);
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadTipe(int id) async {
    final response = await repository.getDetailKosTipe(id: id);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    model = data!;
  }

  Future<void> loadKos(int id) async {
    final response = await repository.getDetailKos(idKos: id);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    kosModel = data!;
  }

  void addImage() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (image != null) {
      FlutterImageCompress.validator.ignoreCheckExtName = true;
      File file = await FlutterExifRotation.rotateImage(path: image.path);
      /* final compressed = await FlutterImageCompress.compressAndGetFile(
          image.path, (await getTemporaryDirectory()).path,
          quality: 88, rotate: 180);
      debugLog('message: $compressed');

      if (compressed == null) return; */

      _doUpload(file);
    }
  }

  void _doUpload(File file) async {
    isLoadingCTA = true;

    final response = await repository.saveFotoTipe(
        idKosTipe: model.id, mainFoto: model.fotos.isEmpty, file: file);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoadingCTA = false;
      failure!.showAlert();
      return;
    }

    isLoadingCTA = false;
    WModal.show(context, title: 'Berhasil', message: data!.message);
    init(idKosTipe: model.id, idKos: model.idKos);
  }
}
