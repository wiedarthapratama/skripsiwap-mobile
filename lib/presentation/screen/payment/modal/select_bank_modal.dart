part of 'modal.dart';

class SelectBankModal extends StatefulWidget {
  const SelectBankModal({Key? key, this.idPemilik}) : super(key: key);

  final int? idPemilik;

  @override
  State<SelectBankModal> createState() => _SelectBankModalState();
}

class _SelectBankModalState extends State<SelectBankModal> {
  final BankRepository bankRepository = Injection.locator<BankRepository>();
  List<BankModel> dataBank = [];
  bool isLoading = false;

  void init() async {
    setState(() {
      isLoading = true;
    });

    final response = await bankRepository.getListBankPemilik(
        idPemilik: widget.idPemilik ?? -1);
    final List<BankModel> data = response.fold((l) => [], (r) => r);

    isLoading = false;
    dataBank = data;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return WBottomSheet(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, position) => const Divider(
                    height: 1,
                    color: WColors.divider,
                  ),
              itemBuilder: (_, position) {
                final model = dataBank[position];

                return ListTile(
                  title: Text(
                    '${model.namaBank} (${model.namaRekening} - ${model.nomorRekening})',
                    style: WTextStyle.body2.semiBold,
                  ),
                  onTap: () => NavigationService().router.popForced(model),
                );
              },
              itemCount: dataBank.length),
    );
  }
}
