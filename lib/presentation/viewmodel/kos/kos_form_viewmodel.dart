import 'package:flutter/material.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/region/region.dart';
import 'package:skripsi_wap/util/util.dart';

class KosFormViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? idKos;

  bool _isLoadingCTA = false;
  bool get isLoadingCTA => _isLoadingCTA;
  set isLoadingCTA(bool value) {
    _isLoadingCTA = value;
    notifyListeners();
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

  void init(int? idKos) {
    this.idKos = idKos;

    if (idKos != null) _loadData();
  }

  void _loadData() async {
    isLoading = true;

    final response = await repository.geDetailKosOwner(idKos: idKos!);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      navigationService.router.popForced();
      failure!.showAlert(context);
      return;
    }

    titleController.text = data!.judul;
    descController.text = data.deskripsi;
    provinceController.text = data.provinsi?.namaProvinsi ?? '';
    cityController.text = data.kabupaten?.namaKabupaten ?? '';
    subdistrictController.text = data.kecamatan?.namaKecamatan ?? '';
    villageController.text = data.desa?.namaDesa ?? '';
    addressController.text = data.alamat;
    urlController.text = data.linkMaps ?? '';
    selectedProvince = data.provinsi;
    selectedCity = data.kabupaten;
    selectedSubdistrict = data.kecamatan;
    selectedVillage = data.desa;
    isLoading = false;
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

  void onSave() async {
    hideKeyboard(context);
    if (!formKey.currentState!.validate()) return;
    if (selectedProvince == null ||
        selectedCity == null ||
        selectedSubdistrict == null ||
        selectedVillage == null) {
      WModal.show(context, title: 'Gagal', message: 'Data belum lengkap');
      return;
    }

    String title = titleController.text;
    String desc = descController.text;
    int province = selectedProvince!.id;
    int city = selectedCity!.id;
    int subdistrict = selectedSubdistrict!.id;
    int village = selectedVillage!.id;
    String address = addressController.text;
    String url = urlController.text;

    if (idKos != null) {
      _doUpdate(
          title: title,
          desc: desc,
          province: province,
          city: city,
          subdistrict: subdistrict,
          village: village,
          address: address,
          url: url);
    } else {
      _doSave(
          title: title,
          desc: desc,
          province: province,
          city: city,
          subdistrict: subdistrict,
          village: village,
          address: address,
          url: url);
    }
  }

  _doSave({
    required String title,
    required String desc,
    required int province,
    required int city,
    required int subdistrict,
    required int village,
    required String address,
    required String url,
  }) async {
    isLoadingCTA = true;

    final response = await repository.saveKos(
        title: title,
        description: desc,
        provinceId: province,
        cityId: city,
        subdistrictId: subdistrict,
        villageId: village,
        address: address,
        urlGoogleMap: url);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert(context);
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: title, message: data!.message);
    navigationService.router.popForced(true);
  }

  _doUpdate({
    required String title,
    required String desc,
    required int province,
    required int city,
    required int subdistrict,
    required int village,
    required String address,
    required String url,
  }) async {
    isLoadingCTA = true;

    final response = await repository.updateKos(
        idKos: idKos!.toString(),
        title: title,
        description: desc,
        provinceId: province,
        cityId: city,
        subdistrictId: subdistrict,
        villageId: village,
        address: address,
        urlGoogleMap: url);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft() && data == null) {
      isLoadingCTA = false;
      failure!.showAlert(context);
      return;
    }

    isLoadingCTA = false;
    await WModal.show(context, title: title, message: data!.message);
    navigationService.router.popForced(true);
  }
}
