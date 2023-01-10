import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/domain/repository/pekerja/pekerja_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/region/region.dart';
import 'package:skripsi_wap/util/util.dart';

class PekerjaFormViewModel extends BaseViewModel {
  final PekerjaRepository repository = Injection.locator<PekerjaRepository>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? idPekerja;

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

  void init(int? idPekerja) {
    this.idPekerja = idPekerja;

    if (idPekerja != null) _loadData();
  }

  void _loadData() async {
    isLoading = true;

    final response = await repository.getDetailPekerja(id: idPekerja!);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    namaController.text = data!.nama;
    nohpController.text = data.nohp;
    provinceController.text = data.provinsi?.namaProvinsi ?? '';
    cityController.text = data.kabupaten?.namaKabupaten ?? '';
    subdistrictController.text = data.kecamatan?.namaKecamatan ?? '';
    villageController.text = data.desa?.namaDesa ?? '';
    addressController.text = data.alamat;
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

    String nama = namaController.text;
    String nohp = nohpController.text;
    int province = selectedProvince!.id;
    int city = selectedCity!.id;
    int subdistrict = selectedSubdistrict!.id;
    int village = selectedVillage!.id;
    String address = addressController.text;

    if (idPekerja != null) {
      _doUpdate(
        nama: nama,
        nohp: nohp,
        province: province,
        city: city,
        subdistrict: subdistrict,
        village: village,
        address: address,
      );
    } else {
      _doSave(
        nama: nama,
        nohp: nohp,
        province: province,
        city: city,
        subdistrict: subdistrict,
        village: village,
        address: address,
      );
    }
  }

  _doSave({
    required String nama,
    required String nohp,
    required int province,
    required int city,
    required int subdistrict,
    required int village,
    required String address,
  }) async {
    isLoadingCTA = true;

    final response = await repository.save(
      name: nama,
      nohp: nohp,
      provinceId: province,
      cityId: city,
      subdistrictId: subdistrict,
      villageId: village,
      address: address,
    );
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
    required String nama,
    required String nohp,
    required int province,
    required int city,
    required int subdistrict,
    required int village,
    required String address,
  }) async {
    isLoadingCTA = true;

    final response = await repository.update(
      idPekerja: idPekerja!,
      name: nama,
      nohp: nohp,
      provinceId: province,
      cityId: city,
      subdistrictId: subdistrict,
      villageId: village,
      address: address,
    );
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
