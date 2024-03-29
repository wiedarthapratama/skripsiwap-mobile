import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/notifikasi/notifikasi_model.dart';
import 'package:skripsi_wap/domain/repository/notifikasi/notifikasi_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';

class NotifikasiViewModel extends BaseViewModel {
  final NotifikasiRepository repository =
      Injection.locator<NotifikasiRepository>();
  List<NotifikasiModel> data = [];

  void init() async {
    isLoading = true;

    final response = await repository.getListNotifikasi();
    final List<NotifikasiModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
    notifyListeners();
  }

  void onRead(NotifikasiModel model, int position) async {
    final response = await repository.readNotification(id: model.id);
    final data = response.fold((l) => false, (r) => r.status);

    this.data[position] = model.copyWith(isRead: data ? 1 : 0);
    notifyListeners();
  }
}
