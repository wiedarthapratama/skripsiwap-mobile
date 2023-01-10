part of 'modal.dart';

class KirimPekerjaModal extends StatelessWidget {
  const KirimPekerjaModal({Key? key, required this.vm}) : super(key: key);

  final PengaduanDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ChangeNotifierProvider<PengaduanDetailViewModel>.value(
        value: vm,
        child: Consumer<PengaduanDetailViewModel>(
          builder: (_, viewModel, __) => WBottomSheet(
            footer: WBottomSheetFooter(
                child: Row(
              children: [
                Expanded(
                    child: WSecondaryButton(
                        title: 'Kembali',
                        onTap: () => NavigationService().router.popForced())),
                WSpacing.horizontal.size8,
                Expanded(
                    child: WPrimaryButton(
                        title: 'Kirim',
                        onTap: () {
                          if (!viewModel.formKey.currentState!.validate())
                            return;
                          NavigationService().router.popForced(true);
                        })),
              ],
            )),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      'Form Kirim Pekerja',
                      style: WTextStyle.headline3.semiBold,
                    ),
                  ),
                  WSpacing.vertical.size16,
                  WPrimaryTextField(
                    hint: 'Nama Pekerja',
                    controller: viewModel.namaPekerjaController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Nama Pekerja masih kosong'
                        : value.hasEmoji
                            ? 'Nama Pekerja tidak boleh mengandung emoji'
                            : null,
                    enable: false,
                    onTap: () async {
                      final PekerjaModel? pekerja = await WModal.builder(
                          context,
                          child: const ListPekerjaModal());

                      if (pekerja != null) {
                        viewModel.namaPekerjaController.text = pekerja.nama;
                        viewModel.selectedPekerja = pekerja;
                      }
                    },
                  ),
                  WSpacing.vertical.size8,
                  WPrimaryTextField(
                    hint: 'Durasi Pekerjaan',
                    controller: viewModel.durasiController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Durasi Pekerjaan masih kosong'
                        : value.hasEmoji
                            ? 'Durasi Pekerjaan tidak boleh mengandung emoji'
                            : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
