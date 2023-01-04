import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class DetailKosViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  late KosTipeModel model;

  void init({required int idKosTipe}) async {
    isLoading = true;

    final response = await repository.getDetailKos(idKosTipe: idKosTipe);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      navigationService.router.popForced();
      failure!.showAlert();
      return;
    }

    model = data!;
    isLoading = false;
    notifyListeners();
  }
}
