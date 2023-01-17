import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/pembayaran/pembayaran_model.dart';
import 'package:skripsi_wap/domain/repository/pembayaran/pembayaran_repository.dart';
import 'package:skripsi_wap/presentation/screen/pemilik/pembayaran/modal/modal.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/util/util.dart';

class PembayaranViewModel extends BaseViewModel {
  final PembayaranRepository repository =
      Injection.locator<PembayaranRepository>();
  List<PembayaranModel> data = [];
  late PembayaranModel dataPembayaran;

  void init() async {
    isLoading = true;

    final response = await repository.getListPembayaran();
    final List<PembayaranModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
    notifyListeners();
  }

  void onTapDetails(PembayaranModel model) async {
    final map = await WModal.builder(context,
        child: PembayaranDetailModal(model: model));

    if (map != null) {
      if (map['status']) {
        _doAccept(idPembayaran: model.id);
      } else {
        _doReject(idPembayaran: model.id, komentar: map['komentar']);
      }
    }
  }

  void _doAccept({required int idPembayaran}) async {
    isLoading = true;

    final response =
        await repository.terimaPembayaran(idPembayaran: idPembayaran);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    await WModal.show(context, title: 'Berhasil', message: data!.message);
    isLoading = false;
    init();
  }

  void _doReject({required int idPembayaran, required String komentar}) async {
    isLoading = true;

    final response = await repository.tolakPembayaran(
        idPembayaran: idPembayaran, komentar: komentar);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    await WModal.show(context, title: 'Berhasil', message: data!.message);
    isLoading = false;
    init();
  }

  /* void _doSubmit(
      {required int idKost,
      required int idKostStok,
      required String buktiBayar,
      required int jumlahBayar,
      required String namaRekening,
      required String namaBank,
      required int toIdBank}) async {
    isLoading = true;

    final response = await repository.submitPembayaran(
        idKost: idKost,
        idKostStok: idKostStok,
        buktiBayar: buktiBayar,
        jumlahBayar: jumlahBayar,
        namaRekening: namaRekening,
        namaBank: namaBank,
        toIdBank: toIdBank);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    await WModal.show(context, title: 'Berhasil', message: data!.message);
    isLoading = false;
    init();
  } */

  void getDetail({required int idPembayaran}) async {
    isLoading = true;

    final response =
        await repository.getDetailPembayaran(idPembayaran: idPembayaran);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    dataPembayaran = data!;
    isLoading = false;
    notifyListeners();
  }
}
