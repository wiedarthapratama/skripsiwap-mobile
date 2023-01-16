import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/data/model/master/bank_model.dart';
import 'package:skripsi_wap/data/model/pekerja/pekerja_model.dart';
import 'package:skripsi_wap/domain/repository/bank/bank_repository.dart';
import 'package:skripsi_wap/domain/repository/pekerja/pekerja_repository.dart';
import 'package:skripsi_wap/presentation/viewmodel/base_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class BankViewModel extends BaseViewModel {
  final BankRepository repository = Injection.locator<BankRepository>();
  List<BankModel> data = [];

  void init() async {
    isLoading = true;

    final response = await repository.getListBankPenyedia();
    final List<BankModel> data = response.fold((l) => [], (r) => r);

    this.data = data;
    isLoading = false;
    notifyListeners();
  }

  void onDelete(BankModel model) async {
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
              Text('Anda yakin akan menghapus ${model.namaBank}?'),
            ],
          ),
        ));

    if (confirm == null) return;

    isLoading = true;
    final response = await repository.deleteBankPenyedia(id: model.id);
    final failure = response.fold((l) => l, (r) => null);
    final data = response.fold((l) => null, (r) => r);

    if (response.isLeft()) {
      isLoading = false;
      failure!.showAlert();
      return;
    }

    WModal.show(context, title: 'Berhasil', message: data!.message);
    init();
  }
}
