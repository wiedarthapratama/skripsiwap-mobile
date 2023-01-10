import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/domain/repository/pengaduan/pengaduan_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class PengaduanViewModel extends BaseViewModel {
  final PengaduanRepository repository =
      Injection.locator<PengaduanRepository>();
  List<PengaduanModel> data = [];

  void init() async {
    isLoading = true;

    final response = await repository.getListPengaduan();
    final List<PengaduanModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
  }
}
