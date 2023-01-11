import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/pendaftaran/pendaftaran_model.dart';
import 'package:skripsi_wap/domain/repository/pengontrak/pengontrak_repository.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/calon_pengontrak/modal/modal.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';

class CalonPengontrakViewModel extends BaseViewModel {
  final PengontrakRepository repository =
      Injection.locator<PengontrakRepository>();
  List<PendaftaranModel> data = [];

  void init() async {
    isLoading = true;

    final response = await repository.getListCalonPengontrak();
    final List<PendaftaranModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
    notifyListeners();
  }

  onTapDetails(PendaftaranModel model) async {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();
    final dialog = await WModal.builder(context,
        child: DetailCalonPengontrakModal(
            formKey: formKey, controller: controller));

    if (dialog != null) {
      isLoading = true;

      final response = await repository.terimaCalonPengontrak(
          idPendaftaran: model.id, nomorKost: controller.text);
      final failure = response.fold((l) => l, (r) => null);
      final data = response.fold((l) => null, (r) => r);

      if (response.isLeft()) {
        isLoading = false;
        failure!.showAlert();
      }

      await WModal.show(context, title: 'Berhasil', message: data!.message);
      isLoading = false;
      init();
    }
  }
}
