part of 'modal.dart';

class PencarianModal extends StatelessWidget {
  const PencarianModal({Key? key, required this.vm}) : super(key: key);

  final HomeViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ChangeNotifierProvider<HomeViewModel>.value(
        value: vm,
        child: Consumer<HomeViewModel>(
          builder: (_, viewModel, __) => WBottomSheet(
            footer: WBottomSheetFooter(
                child: Row(
              children: [
                Expanded(
                    child: WSecondaryButton(
                        title: 'Reset',
                        onTap: () {
                          viewModel.onReset;
                          NavigationService().router.popForced();
                        })),
                WSpacing.horizontal.size8,
                Expanded(
                    child: WPrimaryButton(
                        title: 'Kirim',
                        onTap: () {
                          if (!viewModel.formKey.currentState!.validate()) {
                            return;
                          }
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
                      'Form Pencarian',
                      style: WTextStyle.headline3.semiBold,
                    ),
                  ),
                  WSpacing.vertical.size16,
                  WPrimaryTextField(
                    label: 'Provinsi',
                    enable: false,
                    onTap: viewModel.onTapProvince,
                    controller: viewModel.provinceController,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Kabupaten',
                    enable: false,
                    onTap: viewModel.onTapCity,
                    controller: viewModel.cityController,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Kecamatan',
                    enable: false,
                    onTap: viewModel.onTapSubdistrict,
                    controller: viewModel.subdistrictController,
                  ),
                  WSpacing.vertical.size12,
                  WPrimaryTextField(
                    label: 'Desa',
                    enable: false,
                    onTap: viewModel.onTapVillage,
                    controller: viewModel.villageController,
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
