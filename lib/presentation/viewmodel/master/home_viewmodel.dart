import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_home_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  List<KosHomeModel> dataRekomendasi = [];

  void init() async {
    isLoading = true;

    final response = await repository.getListKos();
    final List<KosHomeModel> data = response.fold((l) => [], (r) => r);
    dataRekomendasi = data;
    isLoading = false;
  }
}
