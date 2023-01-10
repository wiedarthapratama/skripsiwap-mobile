import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/pengontrak/pengontrak_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class KosSayaViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  late PengontrakModel model;

  void init() async {
    isLoading = true;

    final response = await repository.getKosSaya();
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    model = data!;
    isLoading = false;
    notifyListeners();
  }
}
