part of 'modal.dart';

class PembayaranDetailModal extends StatelessWidget {
  const PembayaranDetailModal({Key? key, required this.model})
      : super(key: key);

  final PembayaranModel model;

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
        footer: model.status == 'Menunggu Verifikasi'
            ? WBottomSheetFooter(
                child: Row(
                children: [
                  Expanded(
                      child: WSecondaryButton(
                          title: 'Tolak',
                          onTap: () async {
                            final TextEditingController controller =
                                TextEditingController();
                            final formKey = GlobalKey<FormState>();

                            final dialog = await WModal.builder(context,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Form(
                                      key: formKey,
                                      child: WBottomSheet(
                                          footer: WBottomSheetFooter(
                                              child: WPrimaryButton(
                                            title: 'Tolak',
                                            onTap: () {
                                              if (!formKey.currentState!
                                                  .validate()) {
                                                return;
                                              }

                                              NavigationService()
                                                  .router
                                                  .popForced(true);
                                            },
                                          )),
                                          child: WPrimaryTextField(
                                            hint: 'Komentar',
                                            maxLines: 5,
                                            textFieldType:
                                                WTextFieldType.multiLine,
                                            controller: controller,
                                            validator: (value) => value ==
                                                        null ||
                                                    value.isEmpty
                                                ? 'Komentar tidak boleh kosong'
                                                : null,
                                          )),
                                    )));

                            if (dialog != null) {
                              NavigationService().router.popForced({
                                'status': false,
                                'komentar': controller.text
                              });
                            }
                          })),
                  WSpacingDirection.horizontal.size8,
                  Expanded(
                      child: WPrimaryButton(
                          title: 'Terima',
                          onTap: () => NavigationService()
                              .router
                              .popForced({'status': true}))),
                ],
              ))
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Detail Pembayaran',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nama',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    model.user?.name ?? 'N/A',
                    style: WTextStyle.body2.bold,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            WSpacing.vertical.size8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dari Bank',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    model.namaBank,
                    style: WTextStyle.body2.bold,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            WSpacing.vertical.size8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ke Bank',
                  style: WTextStyle.body2,
                ),
                Expanded(
                  child: Text(
                    model.bank?.namaBank ?? 'N/A',
                    style: WTextStyle.body2.bold,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            WSpacing.vertical.size8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status Pembayaran',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    model.status,
                    style: WTextStyle.body2.bold,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            WSpacing.vertical.size8,
            Text(
              'Bukti Transfer',
              style: WTextStyle.body2,
            ),
            WSpacing.vertical.size6,
            WCacheImage(
              url: model.buktiBayar,
              fit: BoxFit.cover,
            )
          ],
        ));
  }
}
