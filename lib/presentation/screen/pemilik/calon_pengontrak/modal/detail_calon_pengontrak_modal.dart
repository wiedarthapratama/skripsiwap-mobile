part of 'modal.dart';

class DetailCalonPengontrakModal extends StatelessWidget {
  const DetailCalonPengontrakModal(
      {Key? key, required this.formKey, required this.controller})
      : super(key: key);

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: WBottomSheet(
          footer: WBottomSheetFooter(
              child: WPrimaryButton(
                  title: 'Simpan',
                  onTap: () {
                    if (!formKey.currentState!.validate()) return;
                    NavigationService().router.popForced(true);
                  })),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Form Terima Pengontrak',
                  style: WTextStyle.headline3.bold,
                ),
                WSpacing.vertical.size16,
                WPrimaryTextField(
                  hint: 'Masukkan Nomor Kost',
                  controller: controller,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Nomor Kost tidak boleh kosong'
                      : null,
                ),
              ],
            ),
          )),
    );
  }
}
