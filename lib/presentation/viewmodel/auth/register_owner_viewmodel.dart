import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/domain/repository/auth/auth_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/region/region.dart';
import 'package:skripsi_wap/util/util.dart';

class RegisterAsOwnerViewModel extends BaseViewModel {
  final AuthRepository repository = Injection.locator<AuthRepository>();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final key = GlobalKey<FormState>();

  ProvinceModel? _selectedProvince;
  ProvinceModel? get selectedProvince => _selectedProvince;
  set selectedProvince(ProvinceModel? value) {
    _selectedProvince = value;
    notifyListeners();
  }

  CityModel? _selectedCity;
  CityModel? get selectedCity => _selectedCity;
  set selectedCity(CityModel? value) {
    _selectedCity = value;
    notifyListeners();
  }

  SubdistrictModel? _selectedSubdistrict;
  SubdistrictModel? get selectedSubdistrict => _selectedSubdistrict;
  set selectedSubdistrict(SubdistrictModel? value) {
    _selectedSubdistrict = value;
    notifyListeners();
  }

  VillageModel? _selectedVillage;
  VillageModel? get selectedVillage => _selectedVillage;
  set selectedVillage(VillageModel? value) {
    _selectedVillage = value;
    notifyListeners();
  }

  void onTapProvince() async {
    final dialog =
        await navigationService.pushToWidget(const WProvinceRegion());

    if (dialog != null) {
      selectedProvince = dialog;
      provinceController.text = selectedProvince!.namaProvinsi;
      notifyListeners();
    }
  }

  void onTapCity() async {
    if (selectedProvince == null) return;

    final dialog = await navigationService.pushToWidget(WCityRegion(
      id: selectedProvince!.id,
    ));

    if (dialog != null) {
      selectedCity = dialog;
      cityController.text = selectedCity!.namaKabupaten;
      notifyListeners();
    }
  }

  void onTapSubdistrict() async {
    if (selectedCity == null) return;

    final dialog = await navigationService.pushToWidget(WSubdistrictRegion(
      id: selectedCity!.id,
    ));

    if (dialog != null) {
      selectedSubdistrict = dialog;
      subdistrictController.text = selectedSubdistrict!.namaKecamatan;
      notifyListeners();
    }
  }

  void onTapVillage() async {
    if (selectedSubdistrict == null) return;

    final dialog = await navigationService.pushToWidget(WVillageRegion(
      id: selectedSubdistrict!.id,
    ));

    if (dialog != null) {
      selectedVillage = dialog;
      villageController.text = selectedVillage!.namaDesa;
      notifyListeners();
    }
  }

  void onSave() async {
    hideKeyboard(context);
    if (!key.currentState!.validate()) return;
    if (selectedProvince == null ||
        selectedCity == null ||
        selectedSubdistrict == null ||
        selectedVillage == null) {
      WModal.show(context, title: 'Gagal', message: 'Data belum lengkap');
      return;
    }

    isLoading = true;

    final response = await repository.registerAsOwner(
        provinceId: selectedProvince!.id,
        cityId: selectedCity!.id,
        subdistrictId: selectedSubdistrict!.id,
        villageId: selectedVillage!.id,
        address: addressController.text.trim());
    final failure = response.fold((l) => l, (r) => null);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    isLoading = false;
    navigationService.router.popForced();
    WModal.show(context,
        title: 'Selamat',
        message: 'Kamu berhasil mendaftar sebagai pemilik kost');
  }
}
