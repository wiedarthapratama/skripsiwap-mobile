import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/domain/repository/kos/kos_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class KosDetailViewModel extends BaseViewModel {
  final KosRepository repository = Injection.locator<KosRepository>();
  late KosModel model;

  void init(int id) async {
    isLoading = true;

    final response = await repository.getDetailKos(idKos: id);
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

  void onDelete(KosTipeModel model) async {
    final confirm = await WModal.builder(context,
        child: WBottomSheet(
          alignment: CrossAxisAlignment.center,
          footer: WBottomSheetFooter(
              child: Row(
            children: [
              Expanded(
                child: WSecondaryButton(
                    title: 'Batal',
                    onTap: () => navigationService.router.popForced()),
              ),
              WSpacing.horizontal.size12,
              Expanded(
                child: WPrimaryButton(
                    title: 'Ya',
                    onTap: () => navigationService.router.popForced(true)),
              )
            ],
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Konfirmasi',
                style: WTextStyle.headline3.semiBold,
              ),
              WSpacing.vertical.size16,
              Text('Anda yakin akan menghapus ${model.namaTipe}?'),
            ],
          ),
        ));

    if (confirm == null) return;

    isLoading = true;
    final response = await repository.deleteKosTipe(id: model.id);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    WModal.show(context, title: 'Berhasil', message: data!.message);
    init(model.id);
  }
}
