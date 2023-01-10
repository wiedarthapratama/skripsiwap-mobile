import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/pekerja/pekerja_model.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/domain/repository/pengaduan/pengaduan_repository.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pengaduan/modal/modal.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';

class PengaduanDetailViewModel extends BaseViewModel {
  final PengaduanRepository repository =
      Injection.locator<PengaduanRepository>();
  late PengaduanModel model;
  final TextEditingController namaPekerjaController = TextEditingController();
  final TextEditingController durasiController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  PekerjaModel? _selectedPekerja;
  PekerjaModel? get selectedPekerja => _selectedPekerja;
  set selectedPekerja(PekerjaModel? value) {
    _selectedPekerja = value;
    notifyListeners();
  }

  bool _isLoadingCTA = false;
  bool get isLoadingCTA => _isLoadingCTA;
  set isLoadingCTA(bool value) {
    _isLoadingCTA = value;
    notifyListeners();
  }

  void init(int id) async {
    isLoading = true;

    final response = await repository.getDetailPengaduan(id: id);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    model = data!;
    isLoading = false;
    notifyListeners();
  }

  void onSendModal() async {
    namaPekerjaController.text = '';
    durasiController.text = '';
    selectedPekerja = null;
    final dialog =
        await WModal.builder(context, child: KirimPekerjaModal(vm: this));

    if (dialog != null) {
      _onSend();
    }
  }

  void _onSend() async {
    isLoadingCTA = true;

    final response = await repository.kirimPekerja(
        idPengaduan: model.id,
        idPekerja: selectedPekerja!.id,
        durasi: durasiController.text);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoadingCTA = false;
      failure!.showAlert();
      return;
    }

    await WModal.show(context, title: 'Berhasil', message: data!.message);
    isLoadingCTA = false;
    init(model.id);
  }
}
