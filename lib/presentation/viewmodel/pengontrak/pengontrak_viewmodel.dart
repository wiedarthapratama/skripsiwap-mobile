import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';
import 'package:skripsi_wap/domain/repository/pengontrak/pengontrak_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class PengontrakViewModel extends BaseViewModel {
  final PengontrakRepository repository =
      Injection.locator<PengontrakRepository>();
  List<PengontrakModel> data = [];

  void init() async {
    isLoading = true;

    final response = await repository.getListPengontrak();
    final List<PengontrakModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
  }
}
