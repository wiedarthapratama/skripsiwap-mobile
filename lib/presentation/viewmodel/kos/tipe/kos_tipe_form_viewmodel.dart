import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/util/util.dart';

class KosTipeFormViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  final TextEditingController namaTipeController = TextEditingController();
  final TextEditingController jumlahKosController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController jumlahRuangController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? idKosTipe;
  late KosModel kosModel;

  bool _isLoadingCTA = false;
  bool get isLoadingCTA => _isLoadingCTA;
  set isLoadingCTA(bool value) {
    _isLoadingCTA = value;
    notifyListeners();
  }

  bool _selectedPerabot = false;
  bool get selectedPerabot => _selectedPerabot;
  set selectedPerabot(bool value) {
    _selectedPerabot = value;
    notifyListeners();
  }

  bool _selectedRumah = false;
  bool get selectedRumah => _selectedRumah;
  set selectedRumah(bool value) {
    _selectedRumah = value;
    notifyListeners();
  }

  bool _selectedKamarMandi = false;
  bool get selectedKamarMandi => _selectedKamarMandi;
  set selectedKamarMandi(bool value) {
    _selectedKamarMandi = value;
    notifyListeners();
  }

  bool _selectedListrik = false;
  bool get selectedListrik => _selectedListrik;
  set selectedListrik(bool value) {
    _selectedListrik = value;
    notifyListeners();
  }

  void init(int? idKosTipe, KosModel kosModel) {
    this.idKosTipe = idKosTipe;
    this.kosModel = kosModel;
    if (idKosTipe != null) _loadData();
  }

  void _loadData() async {
    isLoading = true;

    final response = await repository.geDetailKosTipe(id: idKosTipe!);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      navigationService.router.popForced();
      failure!.showAlert(context);
      return;
    }

    namaTipeController.text = data!.namaTipe;
    jumlahKosController.text = data.jumlahKontrakan.toString();
    hargaController.text = data.hargaPerBulan.toString();
    jumlahRuangController.text = data.jumlahRuang.toString();
    luasController.text = data.luas;
    selectedPerabot = data.isPerabot == 1;
    selectedRumah = data.isRumah == 1;
    selectedKamarMandi = data.isKamarMandiDalem == 1;
    selectedListrik = data.isListrik == 1;
    isLoading = false;
  }

  void onSave() async {
    hideKeyboard(context);
    if (!formKey.currentState!.validate()) return;

    String namaTipe = namaTipeController.text.trim();
    String jumlahKos = jumlahKosController.text.trim();
    String harga = hargaController.text.trim();
    String jumlahRuang = jumlahRuangController.text.trim();
    String luas = luasController.text.trim();

    if (idKosTipe != null) {
      _doUpdate(
          namaTipe: namaTipe,
          jumlahKos: jumlahKos,
          harga: harga,
          jumlahRuang: jumlahRuang,
          luas: luas);
    } else {
      _doSave(
          namaTipe: namaTipe,
          jumlahKos: jumlahKos,
          harga: harga,
          jumlahRuang: jumlahRuang,
          luas: luas);
    }
  }

  void _doSave(
      {required String namaTipe,
      required String jumlahKos,
      required String harga,
      required String jumlahRuang,
      required String luas}) async {
    isLoadingCTA = true;

    final response = await repository.saveKosTipe(
        idKos: kosModel.id,
        namaTipe: namaTipe,
        jumlahKos: jumlahKos,
        harga: harga,
        jumlahRuang: jumlahRuang,
        luas: luas,
        perabot: selectedPerabot,
        rumah: selectedRumah,
        kamarMandi: selectedKamarMandi,
        listrik: selectedListrik);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert(context);
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: 'Berhasil', message: data!.message);
    navigationService.router.popForced(true);
  }

  void _doUpdate(
      {required String namaTipe,
      required String jumlahKos,
      required String harga,
      required String jumlahRuang,
      required String luas}) async {
    isLoadingCTA = true;

    final response = await repository.updateKosTipe(
        idKosTipe: idKosTipe!,
        idKos: kosModel.id,
        namaTipe: namaTipe,
        jumlahKos: jumlahKos,
        harga: harga,
        jumlahRuang: jumlahRuang,
        luas: luas,
        perabot: selectedPerabot,
        rumah: selectedRumah,
        kamarMandi: selectedKamarMandi,
        listrik: selectedListrik);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert(context);
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: 'Berhasil', message: data!.message);
    navigationService.router.popForced(true);
  }
}
