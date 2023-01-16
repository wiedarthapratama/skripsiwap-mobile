import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_saya_model.dart';
import 'package:skripsi_wap/data/model/master/bank_model.dart';
import 'package:skripsi_wap/domain/repository/bank/bank_repository.dart';
import 'package:skripsi_wap/domain/repository/pembayaran/pembayaran_repository.dart';
import 'package:skripsi_wap/presentation/screen/payment/modal/modal.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/util/util.dart';

class SubmitPembayaranViewModel extends BaseViewModel {
  final PembayaranRepository repository =
      Injection.locator<PembayaranRepository>();
  late KosSayaModel model;
  List<BankModel> dataBank = [];
  final formKey = GlobalKey<FormState>();
  final TextEditingController namaBankController = TextEditingController();
  final TextEditingController namaRekeningController = TextEditingController();
  final TextEditingController bankPemilikController = TextEditingController();
  final TextEditingController buktiController = TextEditingController();

  BankModel? _selectedBank;
  BankModel? get selectedBank => _selectedBank;
  set selectedBank(BankModel? value) {
    _selectedBank = value;
    notifyListeners();
  }

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

  void showBank() async {
    final BankModel? selected = await WModal.builder(context,
        child: SelectBankModal(
          idPemilik: model.kosTipe.kos?.idPemilik,
        ));
    selectedBank = selected;
    bankPemilikController.text = selectedBank == null
        ? ''
        : '${selectedBank?.namaBank} (${selectedBank?.namaRekening} - ${selectedBank?.nomorRekening})';
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

    final response = await repository.submitPembayaran(
        idKost: model.kosTipe.idKos,
        idKostStok: model.idKosJenis,
        buktiBayar: selectedBukti!,
        jumlahBayar: model.kosTipe.hargaPerBulan,
        namaRekening: namaRekeningController.text,
        namaBank: namaBankController.text,
        toIdBank: selectedBank!.id);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    isLoading = false;
    navigationService.router.pop(true);
    WModal.show(context, title: 'Berhasil', message: data!.message);
  }
}
