import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';
import 'package:skripsi_wap/domain/repository/pendaftaran/pendaftaran_repository.dart';
import 'package:skripsi_wap/domain/repository/user/user_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/util/util.dart';

class PendaftaranViewModel extends BaseViewModel {
  final PendaftaranRepository repository =
      Injection.locator<PendaftaranRepository>();
  final UserRepository userRepository = Injection.locator<UserRepository>();

  late KosTipeModel model;

  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController ktpController = TextEditingController();
  final TextEditingController pribadiController = TextEditingController();
  final TextEditingController kkController = TextEditingController();
  final TextEditingController tanggalMulaiController = TextEditingController();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();

  File? _selectedKtp;
  File? get selectedKtp => _selectedKtp;
  set selectedKtp(File? value) {
    _selectedKtp = value;
    notifyListeners();
  }

  File? _selectedPribadi;
  File? get selectedPribadi => _selectedPribadi;
  set selectedPribadi(File? value) {
    _selectedPribadi = value;
    notifyListeners();
  }

  File? _selectedKk;
  File? get selectedKk => _selectedKk;
  set selectedKk(File? value) {
    _selectedKk = value;
    notifyListeners();
  }

  void init(KosTipeModel model) {
    this.model = model;
    loadProfile();
    notifyListeners();
  }

  void loadProfile() async {
    isLoading = true;

    final response = await userRepository.getProfile();
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      showError(message: failure!.message);
      return;
    }

    user = data;
    namaController.text = data!.name;
    emailController.text = data.email;
    teleponController.text = data.nohp;
    isLoading = false;
  }

  void selectKtp() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (image != null) {
      File? file = await FlutterExifRotation.rotateImage(path: image.path);

      selectedKtp = file;
      ktpController.text = selectedKtp?.path.split('/').last ?? '';
    }
  }

  void selectPribadi() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (image != null) {
      File? file = await FlutterExifRotation.rotateImage(path: image.path);

      selectedPribadi = file;
      pribadiController.text = selectedPribadi?.path.split('/').last ?? '';
    }
  }

  void selectKk() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (image != null) {
      File? file = await FlutterExifRotation.rotateImage(path: image.path);

      selectedKk = file;
      kkController.text = selectedKk?.path.split('/').last ?? '';
    }
  }

  void selectDate() async {
    var picked = await showDatePicker(
        context: context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(picked);
      tanggalMulaiController.text = formatted;
    }
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;

    final response = await repository.submitPendaftaran(
        idKost: model.idKos,
        idKostStok: model.id,
        fotoKtp: selectedKtp!,
        fotoPribadi: selectedPribadi!,
        fotoKk: selectedKk!,
        tanggalMulai: tanggalMulaiController.text);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    isLoading = false;
    navigationService.router.push(const BerhasilRoute());
    WModal.show(context, title: 'Berhasil', message: data!.message);
  }
}
