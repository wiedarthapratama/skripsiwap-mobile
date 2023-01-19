import 'package:flutter/material.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/screen/home/search/modal/modal.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/region/region.dart';
import 'package:skripsi_wap/util/util.dart';

class HomeViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  List<KosHomeModel> dataRekomendasi = [];

  final formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();

  void init() async {
    isLoading = true;

    final response = await repository.getRecommendation(
        nama: namaController.text,
        provinceId: _selectedProvince?.id ?? 0,
        cityId: _selectedCity?.id ?? 0,
        subdistrictId: _selectedSubdistrict?.id ?? 0,
        villageId: _selectedVillage?.id ?? 0);
    final List<KosHomeModel> data = response.fold((l) => [], (r) => r);
    dataRekomendasi = data;
    isLoading = false;
  }

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

  void onSearchModal() async {
    final dialog =
        await WModal.builder(context, child: PencarianModal(vm: this));

    if (dialog != null) {
      onSearchSend();
    }
  }

  onSearchSend() async {
    isLoading = true;

    final response = await repository.getRecommendation(
        nama: namaController.text,
        provinceId: _selectedProvince?.id ?? 0,
        cityId: _selectedCity?.id ?? 0,
        subdistrictId: _selectedSubdistrict?.id ?? 0,
        villageId: _selectedVillage?.id ?? 0);
    final List<KosHomeModel> data = response.fold((l) => [], (r) => r);
    dataRekomendasi = data;
    isLoading = false;
  }

  onReset() async {
    namaController.text = '';
    _selectedProvince = null;
    _selectedCity = null;
    _selectedSubdistrict = null;
    _selectedVillage = null;
    notifyListeners();
    onSearchSend();
  }

  void onTapProvince() async {
    hideKeyboard(context);
    final dialog =
        await navigationService.pushToWidget(const WProvinceRegion());

    if (dialog != null) {
      selectedProvince = dialog;
      provinceController.text = selectedProvince!.namaProvinsi;
      notifyListeners();
    }
  }

  void onTapCity() async {
    hideKeyboard(context);
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
    hideKeyboard(context);
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
    hideKeyboard(context);
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
}
