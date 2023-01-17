import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_saya_model.dart';
import 'package:skripsi_wap/data/model/master/bank_model.dart';
import 'package:skripsi_wap/domain/repository/pengaduan/pengaduan_repository.dart';
import 'package:skripsi_wap/presentation/screen/payment/modal/modal.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';

class SubmitPengaduanViewModel extends BaseViewModel {
  final PengaduanRepository repository =
      Injection.locator<PengaduanRepository>();

  late KosSayaModel model;

  final formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController buktiController = TextEditingController();

  File? _selectedBukti;
  File? get selectedBukti => _selectedBukti;
  set selectedBukti(File? value) {
    _selectedBukti = value;
    notifyListeners();
  }

  void init(KosSayaModel model) {
    this.model = model;
    notifyListeners();
  }

  void selectBukti() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (image != null) {
      File? file = await FlutterExifRotation.rotateImage(path: image.path);

      selectedBukti = file;
      buktiController.text = selectedBukti?.path.split('/').last ?? '';
    }
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;

    final response = await repository.submitPengaduan(
        idKost: model.kosTipe.idKos,
        idKostStok: model.idKosJenis,
        fotoPengaduan: selectedBukti!,
        judul: judulController.text,
        deskripsi: deskripsiController.text);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    isLoading = false;
    navigationService.router.popForced(true);
    WModal.show(context, title: 'Berhasil', message: data!.message);
  }
}
