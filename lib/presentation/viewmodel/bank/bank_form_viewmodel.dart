import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/domain/repository/bank/bank_repository.dart';
import 'package:skripsi_wap/domain/repository/pekerja/pekerja_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/region/region.dart';
import 'package:skripsi_wap/util/util.dart';

class BankFormViewModel extends BaseViewModel {
  final BankRepository repository = Injection.locator<BankRepository>();
  final TextEditingController namaRekeningController = TextEditingController();
  final TextEditingController noRekeningController = TextEditingController();
  final TextEditingController namaBankController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? idBank;

  bool _isLoadingCTA = false;
  bool get isLoadingCTA => _isLoadingCTA;
  set isLoadingCTA(bool value) {
    _isLoadingCTA = value;
    notifyListeners();
  }

  void init(int? idBank) {
    this.idBank = idBank;

    if (idBank != null) _loadData();
  }

  void _loadData() async {
    isLoading = true;

    final response = await repository.getDetailBankPenyedia(id: idBank!);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    namaBankController.text = data!.namaBank;
    namaRekeningController.text = data.namaRekening;
    noRekeningController.text = data.nomorRekening;
    isLoading = false;
  }

  void onSave() async {
    hideKeyboard(context);
    if (!formKey.currentState!.validate()) return;

    String namaBank = namaBankController.text;
    String namaRekening = namaRekeningController.text;
    String noRekening = noRekeningController.text;

    if (idBank != null) {
      _doUpdate(
        namaBank: namaBank,
        namaRekening: namaRekening,
        noRekening: noRekening,
      );
    } else {
      _doSave(
        namaBank: namaBank,
        namaRekening: namaRekening,
        noRekening: noRekening,
      );
    }
  }

  _doSave({
    required String namaBank,
    required String namaRekening,
    required String noRekening,
  }) async {
    isLoadingCTA = true;

    final response = await repository.saveBankPenyedia(
        namaBank: namaBank, namaRekening: namaRekening, noRekening: noRekening);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert();
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: 'Berhasil', message: data!.message);
    navigationService.router.popForced(true);
  }

  _doUpdate({
    required String namaBank,
    required String namaRekening,
    required String noRekening,
  }) async {
    isLoadingCTA = true;

    final response = await repository.updateBankPenyedia(
        id: idBank!,
        namaBank: namaBank,
        namaRekening: namaRekening,
        noRekening: noRekening);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert();
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: 'Berhasil', message: data!.message);
    navigationService.router.popForced(true);
  }
}
