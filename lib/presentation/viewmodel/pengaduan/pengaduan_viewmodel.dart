import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/domain/repository/pengaduan/pengaduan_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class PengaduanViewModel extends BaseViewModel {
  final PengaduanRepository repository =
      Injection.locator<PengaduanRepository>();
  List<PengaduanModel> data = [];
  late PengaduanModel dataPengaduan;

  void init() async {
    isLoading = true;

    final response = await repository.getListPengaduan();
    final List<PengaduanModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
  }

  void getDetail({required int id}) async {
    isLoading = true;

    final response = await repository.getDetailPengaduanV2(id: id);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    dataPengaduan = data!;
    isLoading = false;
    notifyListeners();
  }
}
